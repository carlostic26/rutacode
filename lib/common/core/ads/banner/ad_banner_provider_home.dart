import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/common/core/ads/ads_manager.dart';

final adBannerProviderHome =
    StateNotifierProvider<AdBannerNotifierHome, AdBannerStateHome>(
  (ref) => AdBannerNotifierHome(),
);

class AdBannerStateHome {
  final BannerAd? bannerAd;
  final bool isLoaded;
  final AnchoredAdaptiveBannerAdSize? adSize;
  final String? currentScreen;
  final String? errorMessage;

  AdBannerStateHome({
    this.bannerAd,
    this.isLoaded = false,
    this.adSize,
    this.currentScreen,
    this.errorMessage,
  });

  AdBannerStateHome copyWith({
    BannerAd? bannerAd,
    bool? isLoaded,
    AnchoredAdaptiveBannerAdSize? adSize,
    String? currentScreen,
    String? errorMessage,
  }) {
    return AdBannerStateHome(
      bannerAd: bannerAd ?? this.bannerAd,
      isLoaded: isLoaded ?? this.isLoaded,
      adSize: adSize ?? this.adSize,
      currentScreen: currentScreen ?? this.currentScreen,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AdBannerNotifierHome extends StateNotifier<AdBannerStateHome> {
  AdBannerNotifierHome() : super(AdBannerStateHome());

  final RutaAdsIds adsIds = RutaAdsIds();
  bool _isLoading = false;

  Future<void> loadAdaptiveAd(BuildContext context,
      {required String screenId}) async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      // Si ya tenemos un banner cargado para esta pantalla, no hacer nada
      if (state.currentScreen == screenId && state.isLoaded) {
        _isLoading = false;
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
        state = state.copyWith(
          currentScreen: screenId,
          errorMessage: 'No se pudo obtener el tamaño del banner',
        );
        _isLoading = false;
        return;
      }

      // Estado inicial de carga
      state = state.copyWith(
        currentScreen: screenId,
        isLoaded: false,
        errorMessage: null,
      );

      // Crear el nuevo banner
      final bannerAd = BannerAd(
        adUnitId: adsIds.banner_adUnitId,
        size: adSize,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            state = state.copyWith(
              bannerAd: ad as BannerAd,
              isLoaded: true,
              adSize: adSize,
              currentScreen: screenId,
              errorMessage: null,
            );
            _isLoading = false;
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            debugPrint('Error al cargar el banner: ${error.message}');
            ad.dispose();
            state = state.copyWith(
              currentScreen: screenId,
              isLoaded: false,
              errorMessage: error.message,
            );
            _isLoading = false;

            // Intentar cargar de nuevo después de un retraso
            Future.delayed(const Duration(seconds: 10), () {
              loadAdaptiveAd(context, screenId: screenId);
            });
          },
        ),
      );

      await bannerAd.load();
    } catch (e) {
      debugPrint('Error en loadAdaptiveAd: $e');
      state = state.copyWith(
        currentScreen: screenId,
        isLoaded: false,
        errorMessage: e.toString(),
      );
      _isLoading = false;

      // Reintentar después de un error
      Future.delayed(const Duration(seconds: 10), () {
        loadAdaptiveAd(context, screenId: screenId);
      });
    }
  }

  void disposeCurrentAd() {
    if (state.bannerAd != null) {
      state.bannerAd!.dispose();
      state = AdBannerStateHome();
    }
  }

  @override
  void dispose() {
    state.bannerAd?.dispose();
    super.dispose();
  }
}
