import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/detail/presentation/state/detail_sections_state.dart';
import 'package:rutacode/features/detail/presentation/state/provider/get_detail_use_case_provider.dart';
import 'package:rutacode/features/detail/presentation/widgets/code_detail_widget.dart';
import 'package:rutacode/features/detail/presentation/widgets/definition_detail_widget.dart';
import 'package:rutacode/features/languages/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({super.key});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    // NO disposed el _pageController aquí (ya lo hace el provider)
    super.dispose();
  }

  void _startTimer() async {
    final progressRepository = ref.read(progressRepositoryProvider);

    // variables provider para solicitud de datos
    final actualLanguage = ref.watch(actualLanguageProvider);
    final actualModule = ref.watch(actualModuleProvider);
    final actualLevel = ref.watch(actualLevelProvider);
    final topicTitle = ref.watch(topicTitleProvider);
    final subtopicTitle = ref.read(subtopicTitleProvider);
    late final int levelId;

    // Handle different modules using a switch statement
    switch (actualLanguage) {
      case 'Jr':
        levelId = ref.read(actualLevelIdJrProvider);
        break;
      case 'Mid':
        levelId = ref.read(actualLevelIdMidProvider);
        break;
      case 'Sr':
        levelId = ref.read(actualLevelIdSrProvider);
        break;
      default:
        // Default logic for unknown modules
        break;
    }

    // Obtener los notifiers usando los providers family
    final completedSubtopicsNotifier =
        ref.read(completedSubtopicsProvider(actualLanguage).notifier);
    final topicsNotifier =
        ref.read(completedTopicsProvider(actualLanguage).notifier);
    final completedLevelsNotifier = ref.read(completedLevelsProvider.notifier);

    // Verificar si el subtopic ya está completado
    final isSubtopicCompleted = await progressRepository.isSubtopicCompleted(
        actualLanguage, actualModule, actualLevel, topicTitle, subtopicTitle);
    if (isSubtopicCompleted) return;

    _timer = Timer(const Duration(seconds: 1), () async {
      try {
        await progressRepository.createProgressBySubtopic(
          module: actualLanguage,
          levelId: levelId,
          topicId: topicTitle,
          subtopicId: subtopicTitle,
          score: 2,
        );

        completedSubtopicsNotifier.markSubtopicAsCompleted(subtopicTitle);
        await topicsNotifier.checkAndUpdateTopicCompletion(actualLanguage,
            actualModule, actualLevel, topicTitle, subtopicTitle);
        await completedLevelsNotifier.checkAndUpdateLevelCompletionByModule(
            actualLanguage,
            actualModule,
            actualLevel,
            topicTitle,
            subtopicTitle);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('¡+2 puntos acumulados! Sigue repasando.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al guardar el progreso: $e'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getDetailUseCase = ref.read(getDetailUseCaseProvider);
    final subtopicID = ref.watch(subtopicTitleProvider);
    final module = ref.watch(actualModuleProvider);
    final subtopicTitle = ref.watch(subtopicTitleProvider);
    final pageController = ref.watch(pageControllerItemsProvider);

    return FutureBuilder<DetailContentModel>(
      future: getDetailUseCase.call(subtopicID, module),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(
              child: Text('No se encontró detalle del subtema.'));
        }

        final detail = snapshot.data!;

        return Scaffold(
/*           appBar: AppBar(
            title: AppBarDetailWidget(widthScreen: size.width),
            centerTitle: true,
            foregroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                ref.read(appBarSectionProvider.notifier).state =
                    AppBarSection.definition;
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ), */
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
                  subtopicTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    ref.read(appBarSectionProvider.notifier).state = index == 0
                        ? AppBarSection.definition
                        : AppBarSection.code;
                  },
                  children: [
                    DefinitionDetailWidget(
                      heightScreen: size.height,
                      detail: detail,
                    ),
                    CodeDetailWidget(detail: detail),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
