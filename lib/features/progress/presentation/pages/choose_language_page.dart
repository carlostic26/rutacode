import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/home/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/progress/presentation/pages/score_info_page.dart';
import 'package:url_launcher/url_launcher.dart';

/*     onTap: () {
      ref.read(actualLanguageProvider.notifier).state = language.language!;
      ref.read(actualModuleProvider.notifier).state = module;
      if (language.language == 'Flutter') {
        goRutaFlutterDialog(context);
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
 */
class ChooseLanguageScoreScreen extends ConsumerWidget {
  final PageController pageController;

  const ChooseLanguageScoreScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leanguagesAsync = ref.watch(languagesListProvider);

    final actualLanguage = ref.watch(actualLanguageProvider);
    final actualModule = ref.watch(actualModuleProvider);

    return Scaffold(
      body: leanguagesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (leanguages) => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemCount: leanguages.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final language = leanguages[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.122),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(language.urlImage!),
                  backgroundColor: Colors.transparent,
                  radius: 20,
                ),
                title: Text(
                  language.language!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.white),
                childrenPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                children: ['Junior', 'Middle', 'Senior'].map((module) {
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 8),
                    title: Text(
                      module,
                    ),
                    onTap: () {
                      ref.read(actualLanguageProvider.notifier).state =
                          language.language!;
                      ref.read(actualModuleProvider.notifier).state = module;
                      if (language.language == 'Flutter') {
                        goRutaFlutterDialog(context);
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
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
