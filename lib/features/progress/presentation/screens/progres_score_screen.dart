import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/core/ads/banner/ad_banner_provider_puntajes.dart';
import 'package:rutacode/features/progress/presentation/widgets/score_info_widget.dart';

class ProgressScoreScreen extends ConsumerWidget {
  const ProgressScoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adState = ref.watch(adBannerProviderPuntajes);

    // Cargar el banner cuando se construye la pantalla
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
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text(
          'Mis puntajes',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ScoreInfoWidget(module: 'Jr'),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ScoreInfoWidget(module: 'Mid'),
              SizedBox(height: 20),
              ScoreInfoWidget(module: 'Sr'),
            ],
          ),
        ),
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
