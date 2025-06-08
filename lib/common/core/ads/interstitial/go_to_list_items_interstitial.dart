import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/common/core/ads/ads_manager.dart';

final adInterstitialProvider =
    StateNotifierProvider<AdInterstitialNotifier, AdInterstitialState>(
  (ref) => AdInterstitialNotifier(),
);

class AdInterstitialState {
  final InterstitialAd? interstitialAd;
  final bool isLoaded;
  final String? errorMessage;

  AdInterstitialState({
    this.interstitialAd,
    this.isLoaded = false,
    this.errorMessage,
  });

  AdInterstitialState copyWith({
    InterstitialAd? interstitialAd,
    bool? isLoaded,
    String? errorMessage,
  }) {
    return AdInterstitialState(
      interstitialAd: interstitialAd ?? this.interstitialAd,
      isLoaded: isLoaded ?? this.isLoaded,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AdInterstitialNotifier extends StateNotifier<AdInterstitialState> {
  AdInterstitialNotifier() : super(AdInterstitialState());

  final RutaAdsIds adsIds = RutaAdsIds();
  bool _isLoading = false;
  bool _adsInitialized = false;

  Future<void> initialize() async {
    if (_adsInitialized) return;

    try {
      // Verifica si Mobile Ads está inicializado
      await MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
        testDeviceIds: [
          'TEST_DEVICE_ID'
        ], // Agrega tu ID de dispositivo de prueba
      ));

      _adsInitialized = true;
      await loadInterstitialAd();
    } catch (e) {
      debugPrint('Error inicializando Ads: $e');
    }
  }

  Future<void> loadInterstitialAd() async {
    if (_isLoading || !_adsInitialized) return;
    _isLoading = true;

    try {
      state.interstitialAd?.dispose();

      state = state.copyWith(
        isLoaded: false,
        errorMessage: null,
      );

      await InterstitialAd.load(
        adUnitId: adsIds.interstitial_adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            debugPrint('$ad loaded.');
            state = state.copyWith(
              interstitialAd: ad,
              isLoaded: true,
            );
            _isLoading = false;
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
            state = state.copyWith(
              isLoaded: false,
              errorMessage: error.message,
            );
            _isLoading = false;

            // Reintenta después de 10 segundos
            Future.delayed(const Duration(seconds: 10), loadInterstitialAd);
          },
        ),
      );
    } catch (e) {
      debugPrint('Error loading interstitial: $e');
      state = state.copyWith(
        isLoaded: false,
        errorMessage: e.toString(),
      );
      _isLoading = false;
    }
  }

  Future<void> showInterstitialAd(BuildContext context) async {
    // Si no está cargado, intenta cargarlo primero
    if (!state.isLoaded) {
      await loadInterstitialAd();

      // Si aún no está listo después de cargar
      if (!state.isLoaded) {
        debugPrint('Interstitial ad not ready to show.');
        return;
      }
    }

    // Configura los callbacks antes de mostrar
    state.interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadInterstitialAd(); // Carga el siguiente anuncio
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        loadInterstitialAd();
      },
    );

    // Muestra el anuncio
    try {
      state.interstitialAd!.show();
      state = state.copyWith(interstitialAd: null, isLoaded: false);
    } catch (e) {
      debugPrint('Error showing interstitial: $e');
    }
  }

  @override
  void dispose() {
    state.interstitialAd?.dispose();
    super.dispose();
  }
}
