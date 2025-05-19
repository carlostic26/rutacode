import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/languages/presentation/provider/language_providers.dart';
import 'package:rutacode/features/languages/presentation/widgets/leanguage_card_widget.dart';

class HomeLanguageScreen extends ConsumerWidget {
  const HomeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leanguagesAsync = ref.watch(languagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Áreas y lenguajes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        centerTitle: true,
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
            children: leanguages.map((leanguage) {
              return LeanguageCardWidget(
                imageUrl: leanguage.urlImage!,
                onTap: () {
                  // Navegar a la pantalla del lenguaje seleccionado
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
