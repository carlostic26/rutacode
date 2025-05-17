import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/leanguages/presentation/widgets/leanguage_card_widget.dart';

class HomeLeanguagePage extends ConsumerWidget {
  const HomeLeanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Áreas y lenguajes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1,
          padding: const EdgeInsets.all(25),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            LeanguageCardWidget(
              imageUrl:
                  'https://brandslogos.com/wp-content/uploads/images/large/java-logo-1.png',
              onTap: () {},
            ),
            LeanguageCardWidget(
              imageUrl:
                  'https://www.nicepng.com/png/full/893-8937286_python-logo.png',
              onTap: () {},
            ),
            // Más tarjetas...
          ],
        ),
      ),
    );
  }
}
