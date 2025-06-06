import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/common/core/ads/ads_manager.dart';

final adBannerProviderPuntajesSingle = StateNotifierProvider<
    AdBannerNotifierPuntajes, AdBannerStatePuntajesSingle>(
  (ref) => AdBannerNotifierPuntajes(),
);

class AdBannerStatePuntajesSingle {
  final BannerAd? bannerAd;
  final bool isLoaded;
  final AnchoredAdaptiveBannerAdSize? adSize;
  final String? currentScreen;

  AdBannerStatePuntajesSingle({
    this.bannerAd,
    this.isLoaded = false,
    this.adSize,
    this.currentScreen,
  });

  AdBannerStatePuntajesSingle copyWith({
    BannerAd? bannerAd,
    bool? isLoaded,
    AnchoredAdaptiveBannerAdSize? adSize,
    String? currentScreen,
  }) {
    return AdBannerStatePuntajesSingle(
      bannerAd: bannerAd ?? this.bannerAd,
      isLoaded: isLoaded ?? this.isLoaded,
      adSize: adSize ?? this.adSize,
      currentScreen: currentScreen ?? this.currentScreen,
    );
  }
}

class AdBannerNotifierPuntajes
    extends StateNotifier<AdBannerStatePuntajesSingle> {
  AdBannerNotifierPuntajes() : super(AdBannerStatePuntajesSingle());

  final RutaAdsIds adsIds = RutaAdsIds();
  bool _isLoading = false;

  Future<void> loadAdaptiveAd(BuildContext context,
      {required String screenId}) async {
    // Evitar múltiples cargas simultáneas
    if (_isLoading) return;
    _isLoading = true;

    try {
      // Si ya tenemos un banner cargado para esta pantalla, no hacer nada
      if (state.currentScreen == screenId && state.isLoaded) {
        return;
      }

      // Limpiar el banner anterior si existe
      state.bannerAd?.dispose();

      // Obtener el tamaño adaptativo
      final adSize =
          await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate(),
      );

      if (adSize == null) {
        debugPrint('No se pudo obtener el tamaño adaptativo');
        state = AdBannerStatePuntajesSingle(currentScreen: screenId);
        return;
      }

      // Crear el nuevo banner
      final bannerAd = BannerAd(
        adUnitId: adsIds.banner_adUnitId,
        size: adSize,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            state = AdBannerStatePuntajesSingle(
              bannerAd: ad as BannerAd,
              isLoaded: true,
              adSize: adSize,
              currentScreen: screenId,
            );
            _isLoading = false;
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            debugPrint('Error al cargar el banner: ${error.message}');
            ad.dispose();
            state = AdBannerStatePuntajesSingle(currentScreen: screenId);
            _isLoading = false;
          },
        ),
      );

      // Estado intermedio mientras carga
      state = AdBannerStatePuntajesSingle(currentScreen: screenId);
      await bannerAd.load();
    } catch (e) {
      debugPrint('Error en loadAdaptiveAd: $e');
      _isLoading = false;
      state = AdBannerStatePuntajesSingle(currentScreen: screenId);
    }
  }

  void disposeCurrentAd() {
    if (state.bannerAd != null) {
      state.bannerAd!.dispose();
      state = AdBannerStatePuntajesSingle();
    }
  }

  @override
  void dispose() {
    state.bannerAd?.dispose();
    super.dispose();
  }
}
