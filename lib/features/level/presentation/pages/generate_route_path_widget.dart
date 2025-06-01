import 'dart:math';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/home/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/screens/list_content_screen.dart';
import 'package:rutacode/features/progress/domain/use_cases/progress_use_cases.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';

class GenerateLevelsRoutePathWidget extends ConsumerStatefulWidget {
  const GenerateLevelsRoutePathWidget({super.key});

  @override
  ConsumerState<GenerateLevelsRoutePathWidget> createState() =>
      _GenerateLevelsRoutePathWidgetState();
}

class _GenerateLevelsRoutePathWidgetState
    extends ConsumerState<GenerateLevelsRoutePathWidget> {
  late ScrollController _scrollController;
  List<bool> _completionStatus = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _loadData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    final actualLanguage = ref.read(actualLanguageProvider);
    final actualModule = ref.read(actualModuleProvider);
    final getLevelUseCase = ref.read(getLevelUseCaseProvider);
    final progressUseCases = ref.read(progressUseCasesProvider);

    final levelList = await getLevelUseCase.call(actualLanguage, actualModule);
    _completionStatus = await _getLevelCompletionStatus(
        levelList, progressUseCases, actualLanguage, actualModule);

    setState(() => _isLoading = false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    // Variables provider para solicitud de datos
    final actualLanguage = ref.watch(actualLanguageProvider);
    final actualModule = ref.watch(actualModuleProvider);
    final getLevelUseCase = ref.read(getLevelUseCaseProvider);

    // Configuración de posiciones
    final squareCenterScreen = widthScreen * 0.40;
    final squareLeftScreen = widthScreen * 0.10;
    final squareRightScreen = widthScreen * 0.1;

    // Configuración de colores por módulo
    final moduleColors = {
      'Jr': Colors.indigo,
      'Mid': Colors.deepPurple,
      'Sr': Colors.cyan.shade900,
    };
    final moduleBaseColor = moduleColors[actualModule] ?? Colors.green.shade900;
    const rutaColorLineDefault = Colors.grey;
    final levelCompletedLineColor = Colors.green.shade900;

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return FutureBuilder<List<DetailContentModel>>(
      future: getLevelUseCase.call(actualLanguage, actualModule),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No se encontraron niveles.'));
        }

        final levelList = snapshot.data!;
        final widgets = <Widget>[];
        double currentBottom = heightScreen * 0.15;

        for (int i = 0; i < levelList.length; i++) {
          final level = levelList[i];
          final isLevelCompleted =
              i < _completionStatus.length ? _completionStatus[i] : false;

          // Calcular posición del cuadrado
          final squareX = _calculateSquarePosition(
            i: i,
            squareCenter: squareCenterScreen,
            squareLeft: squareLeftScreen,
            squareRight: squareRightScreen,
          );

          // Añadir línea entre niveles (excepto para el último)
          if (i < levelList.length - 1) {
            final lineData = _calculateLinePosition(
              i: i,
              squareX: squareX,
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
                              levelCompletedLineColor, BlendMode.srcIn)
                          : const ColorFilter.mode(
                              rutaColorLineDefault, BlendMode.srcIn),
                      child: Image.asset('assets/icons/bold_linea_asset.png'),
                    ),
                  ),
                ),
              ),
            );
          }

          // Añadir cuadrado del nivel (con bordes redondeados)
          widgets.add(
            Positioned(
              left: squareX,
              bottom: currentBottom,
              child: AnimatedButton(
                shadowDegree: ShadowDegree.dark,
                duration: 0,
                height: heightScreen * 0.07,
                width: widthScreen * 0.22,
                shape: BoxShape.rectangle,
                onPressed: () => _showLevelDialog(
                  context,
                  moduleColors[actualModule]!,
                  level,
                  ref,
                  actualModule,
                  onComplete:
                      _loadData, // Pasamos la función _loadData como callback
                ),
                child: Container(
                  width: widthScreen * 0.3,
                  height: heightScreen * 0.10,
                  decoration: BoxDecoration(
                    color: isLevelCompleted
                        ? Colors.green.shade900
                        : moduleBaseColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: isLevelCompleted
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          )
                        : Text(
                            (i + 1).toString(),
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                  ),
                ),
              ),
            ),
          );

          currentBottom += heightScreen * 0.10;
        }

        return SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            height: currentBottom + heightScreen * 0.02,
            child: Stack(children: widgets),
          ),
        );
      },
    );
  }

  Future<List<bool>> _getLevelCompletionStatus(
    List<DetailContentModel> levels,
    ProgressUseCases progressUseCases,
    String language,
    String module,
  ) async {
    final completionStatus = <bool>[];

    for (final level in levels) {
      final isCompleted = await progressUseCases.isLevelCompleted(
        language: language,
        module: module,
        level: level.level!,
      );
      completionStatus.add(isCompleted);
    }

    return completionStatus;
  }

  double _calculateSquarePosition({
    required int i,
    required double squareCenter,
    required double squareLeft,
    required double squareRight,
  }) {
    if (i % 2 == 0) {
      return i % 4 == 0 ? squareRight * 7 : squareLeft;
    }
    return squareCenter;
  }

  ({double angle, double left, double bottom}) _calculateLinePosition({
    required int i,
    required double squareX,
    required double currentBottom,
    required double heightScreen,
    required double widthScreen,
  }) {
    final lineBottom = currentBottom + heightScreen * 0.035;

    switch (i % 4) {
      case 1:
        return (
          angle: pi,
          left: squareX - widthScreen * 0.225,
          bottom: lineBottom,
        );
      case 2:
        return (
          angle: -pi / 2,
          left: squareX + widthScreen * 0.045,
          bottom: lineBottom - heightScreen * 0.019,
        );
      case 3:
        return (
          angle: pi / 2,
          left: squareX + widthScreen * 0.155,
          bottom: lineBottom + heightScreen * 0.005,
        );
      default:
        return (
          angle: 2 * pi,
          left: squareX - widthScreen * 0.16,
          bottom: lineBottom - heightScreen * 0.01,
        );
    }
  }

  void _showLevelDialog(
    BuildContext context,
    Color moduleColor,
    DetailContentModel content,
    WidgetRef ref,
    String moduleSelected, {
    required VoidCallback onComplete,
  }) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Text(
                    content.titleLevel!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(moduleColor),
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
                  ref.read(actualLevelProvider.notifier).state = content.level!;
                  ref.read(levelTitleProvider.notifier).state =
                      content.titleLevel!;

                  //Navigator.of(context).pop(); // Cerrar el diálogo primero
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListContentScreen(),
                    ),
                  ).then((_) =>
                      onComplete()); // Ejecutar onComplete después de la navegación
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
