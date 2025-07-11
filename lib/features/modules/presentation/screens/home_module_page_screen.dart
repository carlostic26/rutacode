import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/core/ads/banner/ad_banner_provider_home.dart';
import 'package:rutacode/features/detail/presentation/state/detail_sections_state.dart';
import 'package:rutacode/features/languages/presentation/provider/language_providers.dart';
import 'package:rutacode/features/modules/presentation/providers/navigation_home_page_state.dart';
import 'package:rutacode/features/modules/presentation/widgets/home_drawer_widget.dart';
import 'package:rutacode/features/modules/presentation/widgets/module_widget.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/level/presentation/widgets/generate_route_path_widget.dart';
import 'package:rutacode/features/progress/presentation/screens/progres_score_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeModuleScreen extends ConsumerStatefulWidget {
  const HomeModuleScreen({super.key});

  @override
  ConsumerState<HomeModuleScreen> createState() => _HomeModulePageScreenState();
}

class _HomeModulePageScreenState extends ConsumerState<HomeModuleScreen> {
  late final AdBannerStateHome adState; // Guardamos el estado

  @override
  void initState() {
    super.initState();
    adState = ref.read(adBannerProviderHome);
  }

  @override
  void dispose() {
    super.dispose();
    // Usamos la referencia guardada en lugar de ref.read
    if (mounted) {
      if (adState.currentScreen == 'home') {
        ref.read(adBannerProviderHome.notifier).disposeCurrentAd();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(pageControllerProvider);
    final currentIndex = ref.watch(pageIndexProvider);
    final adState = ref.watch(adBannerProviderHome);

    final actualLanguage = ref.watch(actualLanguageProvider);
    final actualModule = ref.watch(actualModuleProvider);

    // Define los AppBars para cada pantalla
    final List<PreferredSizeWidget> appBars = [
      AppBar(
        title: Text(
          'Módulos para $actualLanguage',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      AppBar(
        title: Text(
          'Ruta $actualModule de $actualLanguage',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0.5,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => ref.read(navigationServiceProvider).goBack(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_events),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const ProgressScoreScreen(),
              //   ),
              // );
            },
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: appBars[currentIndex],
      drawer: currentIndex == 0
          ? HomeDrawer(
              context: context,
            )
          : null,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          ref.read(pageIndexProvider.notifier).state = index;
        },
        children: const [
          _ModulesContent(),
          PathLevelWidget(),
        ],
      ),
      bottomNavigationBar: _buildAdBanner(adState),
    );
  }

  Widget _buildAdBanner(AdBannerStateHome adState) {
    if (adState.bannerAd != null && adState.isLoaded) {
      return Container(
        color: Colors.transparent,
        width: adState.bannerAd!.size.width.toDouble(),
        height: adState.bannerAd!.size.height.toDouble(),
        alignment: Alignment.center,
        child: AdWidget(ad: adState.bannerAd!),
      );
    } else {
      return Container(
        height: 50,
        color: Colors.transparent,
      );
    }
  }
}

class _ModulesContent extends ConsumerWidget {
  const _ModulesContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ModuleWidget(
        heightScreen: MediaQuery.of(context).size.height,
        widthScreen: MediaQuery.of(context).size.width,
      ),
    );
  }
}

// PathContent solo contiene el contenido sin Scaffold
class PathLevelWidget extends ConsumerWidget {
  const PathLevelWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const GenerateLevelsRoutePathWidget();
  }
}
