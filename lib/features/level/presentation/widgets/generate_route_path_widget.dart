import 'dart:math';
import 'package:animated_button/animated_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/level/data/models/level_model.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:rutacode/features/level/presentation/widgets/confeti_widget.dart';
import 'package:rutacode/features/list_items/presentation/screens/list_items_screen.dart';

class GenerateLevelsRoutePathWidget extends ConsumerWidget {
  const GenerateLevelsRoutePathWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    // Obtener datos necesarios
    final getLevelUseCase = ref.read(getLevelUseCaseProvider);
    final moduleSelected = ref.watch(actualModuleProvider);
    final completedLevels = ref.watch(
      completedLevelsProvider.select((value) => value[moduleSelected] ?? []),
    );
    final lastCompletedLevel = ref
        .watch(completedLevelsProvider.notifier)
        .getLastCompletedLevelByModule(moduleSelected);

    // Configuración de posiciones
    final circleCenterScreen = widthScreen * 0.40;
    final circleLeftScreen = widthScreen * 0.10;
    final circleRightScreen = widthScreen * 0.10;

    // Configuración de colores por módulo
    final moduleColors = {
      'Jr': Colors.blue,
      'Mid': Colors.orange,
      'Sr': Colors.green,
    };
    final moduleBaseColor = moduleColors[moduleSelected] ?? Colors.green;
    const rutaColorLineDefault = Colors.grey;
    final rutaColorLineCompleted = moduleBaseColor;

    return FutureBuilder<List<LevelModel>>(
      future: getLevelUseCase.call(moduleSelected),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No se encontraron niveles.'));
        }

        final levelList = snapshot.data!;
        final widgets = <Widget>[];
        double currentBottom = heightScreen * 0.15;

        for (int i = 0; i < levelList.length; i++) {
          final level = levelList[i];
          final isLevelCompleted = completedLevels.contains(level.order);
          final isLastCompletedLevel = lastCompletedLevel == level.order;

          // Calcular posición del círculo
          final circleX = _calculateCirclePosition(
            i: i,
            circleCenter: circleCenterScreen,
            circleLeft: circleLeftScreen,
            circleRight: circleRightScreen,
          );

          // Añadir línea entre niveles (excepto para el último)
          if (i < levelList.length - 1) {
            final lineData = _calculateLinePosition(
              i: i,
              circleX: circleX,
              currentBottom: currentBottom,
              heightScreen: heightScreen,
              widthScreen: widthScreen,
            );

            widgets.add(
              Positioned(
                left: lineData.left,
                bottom: lineData.bottom,
                child: Transform.rotate(
                  angle: lineData.angle,
                  child: SizedBox(
                    height: heightScreen * 0.12,
                    child: ColorFiltered(
                      colorFilter: isLevelCompleted
                          ? ColorFilter.mode(
                              rutaColorLineCompleted, BlendMode.srcIn)
                          : const ColorFilter.mode(
                              rutaColorLineDefault, BlendMode.srcIn),
                      child: Image.asset('assets/icons/linea_asset.png'),
                    ),
                  ),
                ),
              ),
            );
          }

          // Añadir círculo del nivel
          widgets.add(
            Positioned(
              left: circleX,
              bottom: currentBottom,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (isLastCompletedLevel)
                    ConfettiAnimation(isCompleted: isLastCompletedLevel),
                  AnimatedButton(
                    shape: BoxShape.circle,
                    height: heightScreen * 0.075,
                    width: heightScreen * 0.075,
                    color: isLevelCompleted ? Colors.green : moduleBaseColor,
                    onPressed: () =>
                        _showLevelDialog(context, level, ref, moduleSelected),
                    enabled: true,
                    shadowDegree: ShadowDegree.light,
                    child: Text(
                      (i + 1).toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );

          currentBottom += heightScreen * 0.10;
        }

        // Configurar scroll automático al final
        final scrollController = ScrollController();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Future.delayed(const Duration(milliseconds: 300), () {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          });
        });

        return SingleChildScrollView(
          controller: scrollController,
          child: SizedBox(
            height: currentBottom + heightScreen * 0.02,
            child: Stack(children: widgets),
          ),
        );
      },
    );
  }

  double _calculateCirclePosition({
    required int i,
    required double circleCenter,
    required double circleLeft,
    required double circleRight,
  }) {
    if (i % 2 == 0) {
      return i % 4 == 0 ? circleRight * 7 : circleLeft;
    }
    return circleCenter;
  }

  ({double angle, double left, double bottom}) _calculateLinePosition({
    required int i,
    required double circleX,
    required double currentBottom,
    required double heightScreen,
    required double widthScreen,
  }) {
    final lineBottom = currentBottom + heightScreen * 0.035;

    switch (i % 4) {
      case 1:
        return (
          angle: pi,
          left: circleX - widthScreen * 0.225,
          bottom: lineBottom,
        );
      case 2:
        return (
          angle: -pi / 2,
          left: circleX + widthScreen * 0.045,
          bottom: lineBottom - heightScreen * 0.019,
        );
      case 3:
        return (
          angle: pi / 2,
          left: circleX + widthScreen * 0.115,
          bottom: lineBottom + heightScreen * 0.005,
        );
      default:
        return (
          angle: 2 * pi,
          left: circleX - widthScreen * 0.21,
          bottom: lineBottom - heightScreen * 0.01,
        );
    }
  }

  void _showLevelDialog(
      BuildContext context, LevelModel level, WidgetRef ref, moduleSelected) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        title: Center(
          child: Text(
            level.title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      level.description!,
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.justify,
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  totalRepeatCount: 1,
                  displayFullTextOnTap: true,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    const Color(0xFF2962FF),
                  ),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                onPressed: () {
                  switch (moduleSelected) {
                    case 'Jr':
                      ref.read(actualLevelIdJrProvider.notifier).state =
                          level.order!;
                      break;
                    case 'Mid':
                      ref.read(actualLevelIdMidProvider.notifier).state =
                          level.order!;
                      break;
                    case 'Sr':
                      ref.read(actualLevelIdSrProvider.notifier).state =
                          level.order!;
                      break;
                    default:
                      break;
                  }

                  ref.read(levelTitleProvider.notifier).state = level.title!;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListItemsScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
