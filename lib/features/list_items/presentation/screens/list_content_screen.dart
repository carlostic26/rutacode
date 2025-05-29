import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/core/ads/banner/ad_banner_provider_detail.dart';
import 'package:rutacode/features/detail/presentation/pages/detail_page.dart';
import 'package:rutacode/features/detail/presentation/widgets/appbar_detail_widget.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/screens/topic_page.dart';
import 'package:rutacode/features/list_items/presentation/screens/subtopic_page.dart';
import 'package:rutacode/features/list_items/presentation/state/current_page_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';

class ListContentScreen extends ConsumerStatefulWidget {
  const ListContentScreen({super.key});

  @override
  ConsumerState<ListContentScreen> createState() => _ListContentScreenState();
}

class _ListContentScreenState extends ConsumerState<ListContentScreen> {
  late PageController _pageController;
  bool _adLoaded = false;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: ref.read(currentContentPageProvider));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_adLoaded) {
        ref.read(adBannerProviderDetail.notifier)
          ..disposeCurrentAd()
          ..loadAdaptiveAd(context, screenId: 'listItems')
              .then((_) => _adLoaded = true);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();

    try {
      ref.read(adBannerProviderDetail.notifier).disposeCurrentAd();
    } catch (e) {
      debugPrint('Error al eliminar el anuncio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final adState = ref.watch(adBannerProviderDetail);
    final size = MediaQuery.of(context).size;

    final levelTitle = ref.watch(levelTitleProvider);
    final titleTopic = ref.watch(titleTopicProvider);
    final titleSubtopic = ref.watch(subtopicTitleProvider);
    final currentPage = ref.watch(currentContentPageProvider);

    // Escuchar cambios en el provider para actualizar el PageController
    ref.listen<int>(currentContentPageProvider, (_, nextPage) {
      if (_pageController.hasClients &&
          _pageController.page?.round() != nextPage) {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    return PopScope(
      canPop: currentPage == 0,
      onPopInvoked: (didPop) {
        if (!didPop) {
          if (currentPage != 0) {
            ref.read(currentContentPageProvider.notifier).state =
                currentPage - 1;
          }
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(
            currentPage, levelTitle, titleTopic, titleSubtopic, size),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            ref.read(currentContentPageProvider.notifier).state = index;
          },
          children: const [
            TopicPage(),
            SubtopicPage(),
            DetailPage(),
          ],
        ),
        bottomNavigationBar: _buildAdBanner(adState),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    int currentPage,
    String levelTitle,
    String titleTopic,
    String titleSubtopic,
    Size size,
  ) {
    switch (currentPage) {
      case 0:
        return AppBar(
          title: Text(
            levelTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 14,
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          foregroundColor: Colors.white,
        );
      case 1:
        return AppBar(
          title: Text(
            titleTopic,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
          leading: IconButton(
            onPressed: () {
              ref.read(currentContentPageProvider.notifier).state = 0;
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          foregroundColor: Colors.white,
        );
      case 2:
        return AppBar(
          title: AppBarDetailWidget(widthScreen: size.width),
          centerTitle: true,
          foregroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              ref.read(currentContentPageProvider.notifier).state = 1;
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        );
      default:
        return AppBar();
    }
  }

  Widget _buildAdBanner(AdBannerStateDetail adState) {
    // Solo mostrar el banner si es para esta pantalla
    if (adState.currentScreen == 'listItems' &&
        adState.bannerAd != null &&
        adState.isLoaded) {
      return SizedBox(
        width: adState.bannerAd!.size.width.toDouble(),
        height: adState.bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: adState.bannerAd!),
      );
    } else {
      return const SizedBox(height: 50);
    }
  }
}
