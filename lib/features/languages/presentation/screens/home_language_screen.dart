import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/languages/presentation/provider/language_providers.dart';
import 'package:rutacode/features/languages/presentation/widgets/leanguage_card_widget.dart';
import 'package:rutacode/features/modules/presentation/screens/home_module_page_screen.dart';
import 'package:rutacode/features/modules/presentation/widgets/home_drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeLanguageScreen extends ConsumerWidget {
  const HomeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leanguagesAsync = ref.watch(languagesListProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Áreas y lenguajes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            ),
          ),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: leanguagesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (leanguages) => Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(25),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: leanguages.map((language) {
                return LeanguageCardWidget(
                  imageUrl: language.urlImage!,
                  onTap: () {
                    // establecer provider de actualLanguage
                    // ref.read(currentLanguageProvider.notifier).setCurrentLanguage(leanguage);
                    // Navegar a la pantalla de modulos
                    // Navigator.push(HomeModuleScreen

                    if (language.language == 'Flutter') {
                      goRutaFlutterDialog(context);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeModuleScreen(),
                          ));
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ),
        drawer: HomeDrawer(
          context: context,
        ));
  }

  Future<dynamic> goRutaFlutterDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Accede a RutaFlutter'),
        content: const Text(
          'Esta sección se encuentra en la app RutaFlutter\n\nPuedes descargarla directamente desde Play Store.',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              const url =
                  'https://play.google.com/store/apps/details?id=com.blogspot.rutaflutter';
              launchUrl(Uri.parse(url));

              Navigator.of(context).pop();
            },
            child: const Text('Ir'),
          ),
        ],
      ),
    );
  }
}
