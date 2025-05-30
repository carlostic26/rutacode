import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/detail/presentation/state/detail_sections_state.dart';
import 'package:rutacode/features/detail/presentation/state/provider/get_detail_use_case_provider.dart';
import 'package:rutacode/features/detail/presentation/widgets/code_detail_widget.dart';
import 'package:rutacode/features/detail/presentation/widgets/definition_detail_widget.dart';
import 'package:rutacode/features/home/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({super.key});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  Timer? _timer;
  bool _hasStartedTimer = false;

  @override
  void initState() {
    super.initState();

    // ✅ Esperar al primer frame antes de iniciar el timer
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasStartedTimer) {
        _hasStartedTimer = true;
        _startTimer();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() async {
    final progressUseCases = ref.read(progressUseCasesProvider);

    final actualLanguage = ref.read(actualLanguageProvider);
    final actualModule = ref.read(actualModuleProvider);
    final actualLevel = ref.read(actualLevelProvider);
    final topicTitle = ref.read(titleTopicProvider);
    final subtopicTitle = ref.read(subtopicTitleProvider);

    final isSubtopicCompleted = await progressUseCases.isSubtopicCompleted(
      language: actualLanguage,
      module: actualModule,
      level: actualLevel,
      topic: topicTitle,
      subtopic: subtopicTitle,
    );

    if (isSubtopicCompleted) return;

    _timer = Timer(const Duration(seconds: 3), () async {
      try {
        await progressUseCases.saveScoreProgressBySubtopic(
          language: actualLanguage,
          module: actualModule,
          levelId: actualLevel,
          topic: topicTitle,
          subtopic: subtopicTitle,
          score: 2,
        );

        if (mounted) {
          // ✅ Ya estás dentro del primer frame, es seguro mostrar el SnackBar
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

    final pageController = ref.watch(pageControllerItemsProvider);

    // Variables provider para solicitud de datos
    final actualLanguage = ref.watch(actualLanguageProvider);
    final actualModule = ref.watch(actualModuleProvider);
    final actualLevel = ref.watch(actualLevelProvider);
    final topicTitle = ref.watch(titleTopicProvider);
    final subtopicTitle = ref.watch(subtopicTitleProvider);

    return FutureBuilder<DetailContentModel>(
      future: getDetailUseCase.call(
          actualLanguage, actualModule, actualLevel, topicTitle, subtopicTitle),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(
              child: Text('📌No se encontró detalle del subtema.'));
        }

        final detail = snapshot.data!;

        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
