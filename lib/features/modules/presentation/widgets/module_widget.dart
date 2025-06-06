import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/modules/presentation/providers/navigation_home_page_state.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';

class ModuleWidget extends ConsumerWidget {
  const ModuleWidget({
    super.key,
    required this.heightScreen,
    required this.widthScreen,
  });

  final double heightScreen;
  final double widthScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildModuleCard(
            context: context,
            ref: ref,
            module: 'Jr',
            title: 'Módulo Junior',
            imagePath: 'assets/images/jr_icon.png',
            isEnabled: true,
            color: Colors.indigo,
          ),
          const SizedBox(height: 45),
          _buildModuleCard(
              context: context,
              ref: ref,
              module: 'Mid',
              title: 'Módulo Middle',
              imagePath: 'assets/images/mid_icon.png',
              isEnabled: true,
              color: Colors.deepPurple),
          const SizedBox(height: 45),
          _buildModuleCard(
              context: context,
              ref: ref,
              module: 'Sr',
              title: 'Módulo Senior',
              imagePath: 'assets/images/sir_icon.png',
              isEnabled: true,
              color: Colors.cyan.shade900),
        ],
      ),
    );
  }

  Widget _buildModuleCard({
    required BuildContext context,
    required WidgetRef ref,
    required String module,
    required String title,
    required String imagePath,
    required bool isEnabled,
    required Color color,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: isEnabled
              ? () {
                  ref.read(actualModuleProvider.notifier).state = module;
                  goToPathScreen(context, module, ref);
                }
              : null,
          child: Container(
            width: widthScreen * 0.3,
            height: heightScreen * 0.15,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                scale: 0.5,
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                height: double.infinity,
                width: heightScreen * 0.15,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void goToPathScreen(BuildContext context, String module, WidgetRef ref) {
    final normalizedModule = module;
    ref.read(actualModuleProvider.notifier).state = normalizedModule;

    final navService = ref.read(navigationServiceProvider);
    navService.navigateTo(1);
  }
}
