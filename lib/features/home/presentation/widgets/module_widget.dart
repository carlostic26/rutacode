import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/home/presentation/providers/navigation_home_page_state.dart';
import 'package:rutacode/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:rutacode/features/level/presentation/state/module_status_provider.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/home/presentation/widgets/spacer_home_widget.dart';

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
    final jrModuleStatus = ref.watch(jrModuleStatusProvider);
    final middleModuleStatus = ref.watch(middleModuleStatusProvider);

    //se observa este provider para habilitar el sig modulo
    ref.watch(completedLevelsProvider);

    String jrDescription =
        'Recorre desde cero los fundamentos esenciales de Flutter y Dart. Repasa la sintaxis, widgets y estructura básica. Gestionar activos y almacenamiento local. Este es el punto de partida perfecto para nuevos desarrolladores.';
    String midDescription =
        'Recorre los conceptos avanzados para construir apps robustas y optimizadas. Gestión de estado, integración con APIs, Firebase,Patrones de diseño, principios SOLID, pruebas automatizadas, técnicas de optimización y bases de datos avanzadas.';
    String srDescription =
        'Optimiza y escala aplicaciones con técnicas avanzadas. Repasa la programación reactiva, Streams y animaciones complejas. Aprende sobre gestión de memoria, Render Objects y CI/CD. Implementa despliegues automatizados y análisis de métricas. Completar este módulo te llevará al nivel de experto en Flutter.';

    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpacerHomeWidget(heightScreen: heightScreen),
          // Junior Dev Module (siempre habilitado)
          _buildModule(
            context: context,
            ref: ref,
            module: 'Jr',
            title: 'Junior Dev',
            description: jrDescription,
            color: Colors.blue,
            imagePath: 'assets/images/jr_dev.png',
            isEnabled: true,
          ),

          SpacerHomeWidget(heightScreen: heightScreen),

          // Middle Dev Module
          jrModuleStatus.when(
            loading: () => _buildLoadingModule(
              title: 'Middle Dev',
              description: midDescription,
              color: Colors.orange,
              imagePath: 'assets/images/middle_dev.png',
            ),
            error: (error, stack) => _buildErrorModule(
              title: 'Middle Dev',
              description: midDescription,
              color: Colors.orange,
              imagePath: 'assets/images/middle_dev.png',
            ),
            data: (isJrCompleted) => _buildModule(
              context: context,
              ref: ref,
              module: 'Mid',
              title: 'Middle Dev',
              description: midDescription,
              color: Colors.orange,
              imagePath: 'assets/images/middle_dev.png',
              isEnabled: isJrCompleted,
            ),
          ),

          SpacerHomeWidget(heightScreen: heightScreen),

          // Senior Dev Module
          middleModuleStatus.when(
            loading: () => _buildLoadingModule(
              title: 'Senior Dev',
              description: srDescription,
              color: Colors.green,
              imagePath: 'assets/images/sr_dev.png',
            ),
            error: (error, stack) => _buildErrorModule(
              title: 'Senior Dev',
              description: srDescription,
              color: Colors.green,
              imagePath: 'assets/images/sr_dev.png',
            ),
            data: (isMiddleCompleted) => _buildModule(
              context: context,
              ref: ref,
              module: 'Sr',
              title: 'Senior Dev',
              description: srDescription,
              color: Colors.green,
              imagePath: 'assets/images/sr_dev.png',
              isEnabled: isMiddleCompleted,
            ),
          ),
        ],
      ),

      // Mostrar candados basados en el estado de los módulos
      jrModuleStatus.maybeWhen(
        data: (isJrCompleted) => !isJrCompleted
            ? _buildLockIcon(heightScreen, widthScreen, 0.395)
            : const SizedBox.shrink(),
        orElse: () => _buildLockIcon(heightScreen, widthScreen, 0.395),
      ),
      middleModuleStatus.maybeWhen(
        data: (isMiddleCompleted) => !isMiddleCompleted
            ? _buildLockIcon(heightScreen, widthScreen, 0.625)
            : const SizedBox.shrink(),
        orElse: () => _buildLockIcon(heightScreen, widthScreen, 0.625),
      ),
    ]);
  }

  Widget _buildModule({
    required BuildContext context,
    required WidgetRef ref,
    required String module,
    required String title,
    required String description,
    required Color color,
    required String imagePath,
    required bool isEnabled,
  }) {
    return GestureDetector(
      onTap: isEnabled
          ? () {
              // Normaliza el módulo antes de navegar
              final normalizedModule = module;
              ref.read(actualModuleProvider.notifier).state = normalizedModule;
              goToPathScreen(context, normalizedModule, ref);
            }
          : () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    'Debes terminar primero el modulo anterior',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: widthScreen * 0.35,
                height: heightScreen * 0.15,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              if (!isEnabled)
                Container(
                  width: widthScreen * 0.35,
                  height: heightScreen * 0.15,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(210, 0, 0, 0),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              if (isEnabled)
                Container(
                  width: widthScreen * 0.35,
                  height: heightScreen * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    highlightColor: Colors.blue.withOpacity(0.2),
                    iconSize: 60,
                    onPressed: () {
                      ref.read(actualModuleProvider.notifier).state = module;
                      goToPathScreen(context, module, ref);
                    },
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: isEnabled ? color : color.withOpacity(0.3),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: isEnabled
                          ? Colors.white
                          : Colors.white.withOpacity(0.3),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.justify,
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingModule({
    required String title,
    required String description,
    required Color color,
    required String imagePath,
  }) {
    return Row(
      children: [
        Container(
          width: widthScreen * 0.35,
          height: heightScreen * 0.15,
          decoration: BoxDecoration(
            color: color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(child: CircularProgressIndicator()),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: color.withOpacity(0.3),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.justify,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorModule({
    required String title,
    required String description,
    required Color color,
    required String imagePath,
  }) {
    return Row(
      children: [
        Container(
          width: widthScreen * 0.35,
          height: heightScreen * 0.15,
          decoration: BoxDecoration(
            color: color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: color.withOpacity(0.3),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const Text(
                  'Error al verificar estado del módulo',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.justify,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLockIcon(double height, double width, double topPosition) {
    return Positioned(
      top: height * topPosition,
      left: width * 0.065,
      child: SizedBox(
        width: width * 0.22,
        height: height * 0.08,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/icons/icono_cerrado.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void goToPathScreen(BuildContext context, String module, WidgetRef ref) {
    final normalizedModule = module;
    ref.read(actualModuleProvider.notifier).state = normalizedModule;
    ref
        .read(completedLevelsProvider.notifier)
        .loadModuleLevels(normalizedModule);

    final navService = ref.read(navigationServiceProvider);
    navService.navigateTo(1);
  }

/*   void goToPathScreen(BuildContext context, String module, WidgetRef ref) {
    // Normaliza el módulo a minúsculas
    final normalizedModule = module;

    // Establece el módulo actual
    ref.read(actualModuleProvider.notifier).state = normalizedModule;

    // Cuando cambies de módulo, carga sus niveles completados
    ref
        .read(completedLevelsProvider.notifier)
        .loadModuleLevels(normalizedModule);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PathScreen()),
    );
  } */
}
