import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/core/ads/banner/ad_banner_provider_detail.dart';
import 'package:rutacode/features/detail/presentation/screens/detail_screen.dart';
import 'package:rutacode/features/detail/presentation/widgets/appbar_detail_widget.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/screens/topic_page.dart';
import 'package:rutacode/features/list_items/presentation/screens/subtopic_page.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);

class ListItemsScreen extends ConsumerStatefulWidget {
  const ListItemsScreen({super.key});

  @override
  ConsumerState<ListItemsScreen> createState() => _ListItemsScreenState();
}

class _ListItemsScreenState extends ConsumerState<ListItemsScreen> {
  late PageController _pageController;
  bool _adLoaded = false;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: ref.read(currentPageProvider));
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
    // Forzar la disposición del banner al salir de la pantalla
    ref.read(adBannerProviderDetail.notifier).disposeCurrentAd();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final levelTitle = ref.watch(levelTitleProvider);
    final titleTopic = ref.watch(topicTitleProvider);
    final titleSubtopic = ref.watch(subtopicTitleProvider);
    final adState = ref.watch(adBannerProviderDetail);
    final size = MediaQuery.of(context).size;

    // Escuchar cambios en el provider para actualizar el PageController
    ref.listen<int>(currentPageProvider, (_, nextPage) {
      if (_pageController.hasClients &&
          _pageController.page?.round() != nextPage) {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    return Scaffold(
      //si estoy en page 0 este es el appbar
      appBar: _buildAppBar(ref.watch(currentPageProvider), levelTitle,
          titleTopic, titleSubtopic, size),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          // Actualizar el provider cuando el usuario hace swipe manual (aunque está desactivado)
          ref.read(currentPageProvider.notifier).state = index;
        },
        children: const [TopicScreen(), SubtopicScreen(), DetailScreen()],
      ),
      bottomNavigationBar: _buildAdBanner(adState),
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
              ref.read(currentPageProvider.notifier).state = 0;
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
              ref.read(currentPageProvider.notifier).state = 1;
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
