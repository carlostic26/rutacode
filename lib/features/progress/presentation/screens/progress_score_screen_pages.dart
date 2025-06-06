import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/common/core/ads/banner/ad_banner_provider_puntajes_page.dart';
import 'package:rutacode/features/home/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/progress/presentation/pages/choose_language_page.dart';
import 'package:rutacode/features/progress/presentation/pages/score_info_page.dart';
import 'package:rutacode/features/progress/presentation/state/progress_score_page_index_provider.dart';
import 'package:rutacode/features/progress/presentation/widgets/score_info_widget.dart';

class ProgressScoreScreen extends ConsumerWidget {
  const ProgressScoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adState = ref.watch(adBannerProviderPuntajes);
    final PageController pageController = PageController();
    final currentPage = ref.watch(progressScorePageIndexProvider);

    // Load the banner when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(adBannerProviderPuntajes.notifier)
          .loadAdaptiveAd(context, screenId: 'progressScore');
    });

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (currentPage == 0) {
              Navigator.pop(context);
            } else {
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Consumer(
          builder: (context, ref, child) {
            final index = ref.watch(progressScorePageIndexProvider);
            return Text(
              index == 0
                  ? 'Progresos'
                  : 'Mis puntajes en ${ref.watch(actualLanguageProvider)}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 16),
            );
          },
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          ref.read(progressScorePageIndexProvider.notifier).state = index;
        },
        children: [
          ChooseLanguageScoreScreen(pageController: pageController),
          Consumer(
            builder: (context, ref, child) {
              final language = ref.watch(actualLanguageProvider);
              final module = ref.watch(actualModuleProvider);
              return ScoreInfoPage(language: language, module: module);
            },
          ),
        ],
      ),
      bottomNavigationBar: _buildAdBanner(adState),
    );
  }

  Widget _buildAdBanner(AdBannerStatePuntajes adState) {
    if (adState.currentScreen == 'progressScore' &&
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
