import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/core/ads/banner/ad_banner_provider_impstr.dart';
import 'package:rutacode/features/home/presentation/widgets/body_text_impostor_provider_state.dart';

class ImpostorScreen extends ConsumerStatefulWidget {
  const ImpostorScreen({super.key});

  @override
  ConsumerState<ImpostorScreen> createState() => _ImpostorScreenState();
}

class _ImpostorScreenState extends ConsumerState<ImpostorScreen> {
  late PageController _pageController;
  bool _adLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_adLoaded) {
        ref.read(adBannerProviderImpstr.notifier)
          ..disposeCurrentAd()
          ..loadAdaptiveAd(context, screenId: 'impstr')
              .then((_) => _adLoaded = true);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();

    try {
      ref.read(adBannerProviderImpstr.notifier).disposeCurrentAd();
    } catch (e) {
      debugPrint('Error al eliminar el anuncio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final adState = ref.watch(adBannerProviderImpstr);

    final titleText = ref.watch(titleTextImpostorProvider);
    final bodyText = ref.watch(bodyTextImpostorProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: Text(
          titleText,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://blogger.googleusercontent.com/img/a/AVvXsEihnT_SyY7Sh4aZR_4tcXHNrhCWmLT1GvEeY_IvcmXEoBIGXQODUZDFibesDHj4jfapViWoo6XqcU_Fazl57lIpxhGFr-DNqAGlYbNA0MYP-ew503XBZaMu-OZPDS9iCM2_--kvN3FhwfDEbo0NRiHU9S35bELmioORGunqg8F7fXT5vXbHl_hG6RvM',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                bodyText,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildAdBanner(adState),
    );
  }
}

Widget _buildAdBanner(AdBannerStateImpstr adState) {
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
