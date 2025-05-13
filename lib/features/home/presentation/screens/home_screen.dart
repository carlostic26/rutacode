/* import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/home/presentation/widgets/home_drawer_widget.dart';
import 'package:rutacode/features/home/presentation/widgets/module_widget.dart';
import 'package:rutacode/features/level/presentation/state/module_status_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jrModuleStatus = ref.watch(jrModuleStatusProvider);
    final middleModuleStatus = ref.watch(middleModuleStatusProvider);

    // Mostrar loading mientras se cargan los datos
    if (jrModuleStatus.isLoading || middleModuleStatus.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Módulos',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu))),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25),
        child:
            ModuleWidget(heightScreen: heightScreen, widthScreen: widthScreen),
      ),
      drawer: HomeDrawer(
        context: context,
      ),
      bottomNavigationBar:
          SizedBox(height: heightScreen * 0.08, child: const Placeholder()),
    );
  }
}
 */