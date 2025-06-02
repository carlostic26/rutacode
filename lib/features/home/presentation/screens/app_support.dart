import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/core/ads/ads_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AppSupport extends StatefulWidget {
  const AppSupport({super.key});

  @override
  State<AppSupport> createState() => _AppSupportState();
}

const int maxAttempts = 2;

class _AppSupportState extends State<AppSupport> {
  RewardedAd? _rewardedAd;
  int _rewardedAdAttempts = 0;
  bool _isLoading = false;
  int _supportCoins = 0;

  final String _rewardedAdUnitId = RutaAdsIds().reward_adUnitId;

  static const AdRequest request = AdRequest();

  @override
  void initState() {
    super.initState();
    _loadCoins();
    _createRewardedAd();
  }

  Future<void> _loadCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _supportCoins = prefs.getInt('supportCoins') ?? 0;
    });
  }

  Future<void> _addSupportCoin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int newCoins = _supportCoins + 1;
    await prefs.setInt('supportCoins', newCoins);
    setState(() => _supportCoins = newCoins);
  }

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: _rewardedAdUnitId,
      request: request,
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _rewardedAd = ad;
            _rewardedAdAttempts = 0;
          });
        },
        onAdFailedToLoad: (error) {
          setState(() {
            _rewardedAdAttempts++;
            _rewardedAd = null;
          });

          if (_rewardedAdAttempts <= maxAttempts) {
            _createRewardedAd();
          }
        },
      ),
    );
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<void> _showRewardedAd() async {
    if (_rewardedAd == null) {
      if (_rewardedAdAttempts <= maxAttempts) {
        Fluttertoast.showToast(
          msg: "Cargando anuncio... Por favor intenta de nuevo.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        _createRewardedAd();
      } else {
        Fluttertoast.showToast(
          msg: "No hay anuncios disponibles en este momento. Vuelve más tarde.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
      return;
    }

    setState(() => _isLoading = true);

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        _addSupportCoin();
        _showThankYouDialog();
        ad.dispose();
        _createRewardedAd();
        setState(() => _isLoading = false);
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _createRewardedAd();
        setState(() => _isLoading = false);
        Fluttertoast.showToast(
          msg: "Error al mostrar el anuncio",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
    );

    _rewardedAd!.show(onUserEarnedReward: (ad, reward) {});
    _rewardedAd = null;
  }

  void _showThankYouDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Gracias por tu apoyo!'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.volunteer_activism, size: 50, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Tu apoyo nos ayuda a seguir mejorando la aplicación.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            /*         const SizedBox(height: 10),
            Text(
              'Apoyos totales: $_supportCoins',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ), */
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  Future<void> _onSupportPressed() async {
    if (_isLoading) return;

    final hasConnection = await _checkInternetConnection();
    if (!hasConnection) {
      Fluttertoast.showToast(
        msg: "No hay conexión a internet. Conéctate para continuar.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }

    await _showRewardedAd();
  }

  Widget _buildBenefit(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.indigo),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Ilustración/icono
            Icon(
              Icons.volunteer_activism,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 30),

            // Mensaje principal
            const Text(
              '¡Tu apoyo hace la diferencia!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Descripción
            const Text(
              'Hemos invertido cientos de horas desarrollando RutaCode para crear la mejor '
              'experiencia de aprendizaje. Con tu apoyo podremos seguir mejorando la app, '
              'añadiendo nuevo contenido y manteniendo todo actualizado.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            _buildBenefit(Icons.update, 'Actualizaciones frecuentes'),
            _buildBenefit(Icons.code, 'Nuevos ejemplos de código'),
            _buildBenefit(Icons.quiz, 'Más exámenes prácticos'),
            const SizedBox(height: 40),

            if (_isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton.icon(
                onPressed: _onSupportPressed,
                icon: const Icon(Icons.visibility, size: 24),
                label: const Text(
                  'APOYAR',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

            const SizedBox(height: 12),

            // Texto pequeño
            const Text(
              'Gana 2 puntos para tu dashboard + nuestro agradecimiento por ver un anuncio breve (solo toma unos segundos).',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }
}
