import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/exam/presentation/screens/choose_exam_screen.dart';
import 'package:rutacode/features/home/presentation/provider/language_providers.dart';
import 'package:rutacode/features/home/presentation/widgets/leanguage_card_widget.dart';
import 'package:rutacode/features/modules/presentation/screens/module_screen.dart';
import 'package:rutacode/features/home/presentation/widgets/home_drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeLanguageScreen extends ConsumerWidget {
  const HomeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leanguagesAsync = ref.watch(languagesListProvider);

    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.indigo,
          title: const Text(
            'Home - Áreas y lenguajes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            ),
          ),

          actions: [
            IconButton(
              icon: const Icon(Icons.checklist),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChooseExamScreen(),
                    ));
              },
            ),
          ],
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: leanguagesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (leanguages) => Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(39),
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: leanguages.map((language) {
                return LeanguageCardWidget(
                  imageUrl: language.urlImage!,
                  onTap: () {
                    ref.read(actualLanguageProvider.notifier).state =
                        language.language!;

                    if (language.language == 'Flutter') {
                      goRutaFlutterDialog(context);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ModuleAndPathPageScreen(),
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
