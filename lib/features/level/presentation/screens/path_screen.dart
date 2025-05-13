/* import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/final_exam/presentation/screens/exam_screen.dart';
import 'package:rutacode/features/home/presentation/providers/navigation_home_page_state.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:rutacode/features/level/presentation/widgets/generate_route_path_widget.dart';
import 'package:rutacode/features/progress/presentation/screens/progres_score_screen.dart';

class PathScreen extends ConsumerStatefulWidget {
  const PathScreen({super.key});

  @override
  ConsumerState<PathScreen> createState() => _PathScreenState();
}

class _PathScreenState extends ConsumerState<PathScreen> {
  bool _hasShownDialog = false;
  Timer? _dialogTimer;

  @override
  void dispose() {
    _dialogTimer?.cancel(); // Cancelar el timer al destruir el widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedModule = ref.watch(actualModuleProvider);
    final completedLevels = ref.watch(completedLevelsProvider);
    final levelsForModule = completedLevels[selectedModule] ?? [];

    // Obtener la lista total de niveles para este módulo
    final getLevelUseCase = ref.read(getLevelUseCaseProvider);

    // Verificar si se completaron todos los niveles
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_hasShownDialog) return;

      final allLevels = await getLevelUseCase.call(selectedModule);
      if (allLevels.isNotEmpty && levelsForModule.length == allLevels.length) {
        _hasShownDialog = true;
        _scheduleCompletionDialog(
            context, selectedModule); // Programar el diálogo con retraso
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ruta $selectedModule',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0.5,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            final navService = ref.read(navigationServiceProvider);
            navService.goBack();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_events),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProgressScoreScreen()),
              );
            },
          ),
        ],
      ),
      body: const GenerateLevelsRoutePathWidget(),
      bottomNavigationBar: const SizedBox(height: 80, child: Placeholder()),
    );
  }

  void _scheduleCompletionDialog(BuildContext context, selectedModule) {
    _dialogTimer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        _showAllLevelsCompletedDialog(context, selectedModule);
      }
    });
  }

  void _showAllLevelsCompletedDialog(BuildContext context, selectedModule) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: const Center(
          child: Text(
            '¡Logro Desbloqueado!',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '¡Felicidades! Has completado todos los niveles de este módulo.\n\n'
              'Estás listo para tomar el examen final y demostrar tus habilidades '
              'como Flutter Developer Junior.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                switch (selectedModule) {
                  case 'Jr':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExamScreen(
                                moduleId: 'Sr',
                              )),
                    );
                    break;
                  case 'Mid':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExamScreen(
                                moduleId: 'Mid',
                              )),
                    );
                    break;
                  case 'Sr':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExamScreen(
                                moduleId: 'Sr',
                              )),
                    );
                    break;
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Módulo desconocido')),
                    );
                }
              },
              child: const Text('Ir al Examen Final',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:
                  const Text('Más tarde', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
 */