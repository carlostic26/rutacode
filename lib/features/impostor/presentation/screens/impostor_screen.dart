import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rutacode/features/impostor/presentation/state/body_text_impostor_provider_state.dart';

class ImpostorScreen extends ConsumerWidget {
  const ImpostorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    );
  }
}
