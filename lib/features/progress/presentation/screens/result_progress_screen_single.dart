import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/common/core/ads/banner/ad_banner_provider_puntajes_page.dart';
import 'package:rutacode/common/core/ads/banner/ad_banner_provider_puntajes_single.dart';
import 'package:rutacode/features/home/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/progress/presentation/pages/score_info_page.dart';

class ResultProgressScreenSingle extends ConsumerStatefulWidget {
  const ResultProgressScreenSingle({super.key});

  @override
  ConsumerState<ResultProgressScreenSingle> createState() =>
      _ResultProgressScreenState();
}

class _ResultProgressScreenState
    extends ConsumerState<ResultProgressScreenSingle> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAdWithDelay();
    });
  }

  Future<void> _loadAdWithDelay() async {
    try {
      await ref.read(adBannerProviderPuntajesSingle.notifier).loadAdaptiveAd(
            context,
            screenId: 'progressScoreScreenSingle',
          );
    } catch (e) {
      debugPrint('Error al cargar anuncio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final adState = ref.watch(adBannerProviderPuntajes);
    final language = ref.watch(actualLanguageProvider);
    final module = ref.watch(actualModuleProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          'Mis puntajes en $language',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'Inter', fontSize: 16),
        ),
      ),
      body: ScoreInfoPage(language: language, module: module),
      bottomNavigationBar: _buildAdBanner(adState),
    );
  }

  Widget _buildAdBanner(AdBannerStatePuntajes adState) {
    if (adState.currentScreen == 'progressScoreScreenSingle' &&
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

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(adBannerProviderPuntajes.notifier).disposeCurrentAd();
      }
    });
    super.dispose();
  }
}

/* import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/core/ads/banner/ad_banner_provider_puntajes_page.dart';
import 'package:rutacode/core/ads/banner/ad_banner_provider_single.dart';
import 'package:rutacode/features/home/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/progress/presentation/pages/score_info_page.dart';

class ResultProgressScreen extends ConsumerWidget {
  const ResultProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adState = ref.watch(adBannerProviderPuntajes);
    final language = ref.watch(actualLanguageProvider);
    final module = ref.watch(actualModuleProvider);

    // Load the banner when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(adBannerProviderPuntajesSingle.notifier)
          .loadAdaptiveAd(context, screenId: 'progressScoreScreenSingle');
    });

    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          title: Text(
            'Mis puntajes en $language',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Inter', fontSize: 16),
          )),
      body: Consumer(
        builder: (context, ref, child) {
          return ScoreInfoPage(language: language, module: module);
        },
      ),
      bottomNavigationBar: _buildAdBanner(adState),
    );
  }

  Widget _buildAdBanner(AdBannerStatePuntajes adState) {
    if (adState.currentScreen == 'progressScoreScreenSingle' &&
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
 */