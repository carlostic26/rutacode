import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/common/core/ads/ads_manager.dart';

final adBannerProviderPuntajes =
    StateNotifierProvider<AdBannerNotifierPuntajes, AdBannerStatePuntajes>(
  (ref) => AdBannerNotifierPuntajes(),
);

class AdBannerStatePuntajes {
  final BannerAd? bannerAd;
  final bool isLoaded;
  final AnchoredAdaptiveBannerAdSize? adSize;
  final String? currentScreen;

  AdBannerStatePuntajes({
    this.bannerAd,
    this.isLoaded = false,
    this.adSize,
    this.currentScreen,
  });

  AdBannerStatePuntajes copyWith({
    BannerAd? bannerAd,
    bool? isLoaded,
    AnchoredAdaptiveBannerAdSize? adSize,
    String? currentScreen,
  }) {
    return AdBannerStatePuntajes(
      bannerAd: bannerAd ?? this.bannerAd,
      isLoaded: isLoaded ?? this.isLoaded,
      adSize: adSize ?? this.adSize,
      currentScreen: currentScreen ?? this.currentScreen,
    );
  }
}

class AdBannerNotifierPuntajes extends StateNotifier<AdBannerStatePuntajes> {
  AdBannerNotifierPuntajes() : super(AdBannerStatePuntajes());

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
        state = AdBannerStatePuntajes(currentScreen: screenId);
        return;
      }

      // Crear el nuevo banner
      final bannerAd = BannerAd(
        adUnitId: adsIds.banner_adUnitId,
        size: adSize,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            state = AdBannerStatePuntajes(
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
            state = AdBannerStatePuntajes(currentScreen: screenId);
            _isLoading = false;
          },
        ),
      );

      // Estado intermedio mientras carga
      state = AdBannerStatePuntajes(currentScreen: screenId);
      await bannerAd.load();
    } catch (e) {
      debugPrint('Error en loadAdaptiveAd: $e');
      _isLoading = false;
      state = AdBannerStatePuntajes(currentScreen: screenId);
    }
  }

  void disposeCurrentAd() {
    if (state.bannerAd != null) {
      state.bannerAd!.dispose();
      state = AdBannerStatePuntajes();
    }
  }

  @override
  void dispose() {
    state.bannerAd?.dispose();
    super.dispose();
  }
}
