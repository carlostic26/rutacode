import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:rutacode/common/core/ads/banner/ad_banner_provider_result.dart';
import 'package:rutacode/common/core/services/shared_preferences_service.dart';
import 'package:rutacode/features/exam/presentation/state/provider/exam_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/result_item_widget.dart';

class ResultsScreen extends ConsumerStatefulWidget {
  const ResultsScreen({super.key});

  @override
  ConsumerState<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends ConsumerState<ResultsScreen> {
  late Future<bool> _loadingFuture;
  int _correctAnswersCount = 0;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _loadingFuture = _calculateResults();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adBannerProviderResult.notifier).loadAdaptiveAd(
            context,
            screenId: 'resultScreen',
          );

      _setExamCompleted();
    });
  }

  @override
  void dispose() {
    _loadingFuture.ignore();
    if (mounted) {
      ref.read(examStateProvider.notifier).resetExamState();
      ref.read(adBannerProviderResult.notifier).disposeCurrentAd();
    }
    super.dispose();
  }

  Future<bool> _calculateResults() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;

      final examState = ref.read(examStateProvider);

      _correctAnswersCount = examState.questions
          .where((question) =>
              examState.userAnswers[question.id] == question.correctAnswer)
          .length;

      // Calcular el porcentaje de respuestas correctas
      _progressValue = _correctAnswersCount / examState.questions.length;

      debugPrint(
          'Resultado calculado: $_correctAnswersCount/${examState.questions.length}');
      return true;
    } catch (e) {
      debugPrint('Error calculando resultados: $e');
      return false;
    }
  }

  Future<void> _setExamCompleted() async {
    final language = ref.watch(examLanguageSelectedProvider);
    final module = ref.watch(examModuleSelectedProvider);

    final prefs = await SharedPreferences.getInstance();
    final sharedPrefsService = SharedPreferencesService(prefs);

    sharedPrefsService.markExamAsCompleted(language, module);
  }

  @override
  Widget build(BuildContext context) {
    final examState = ref.watch(examStateProvider);
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;
    final adState = ref.watch(adBannerProviderResult);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Resultados',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            ref.read(examStateProvider.notifier).resetExamState();
            Navigator.pop(context);
          },
        ),
        actions: [
          FutureBuilder(
            future: _loadingFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '$_correctAnswersCount/${examState.questions.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: _loadingFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return SizedBox(
                height: heightScreen,
                width: widthScreen,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: heightScreen * 0.105,
                      child: SizedBox(
                        width: widthScreen,
                        height: heightScreen * 0.3,
                        child: Lottie.asset(
                          'assets/animations/funny_loading.json',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: heightScreen * 0.43,
                      child: Text(
                        'Calculando tu puntuación...',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Circular Progress Indicator
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: CircularProgressIndicator(
                            value: _progressValue,
                            strokeWidth: 12,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              _progressValue >= 0.7
                                  ? Colors.green
                                  : _progressValue >= 0.4
                                      ? Colors.orange
                                      : Colors.red,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${(_progressValue * 100).toStringAsFixed(0)}%',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$_correctAnswersCount/${examState.questions.length}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Texto de resultado
                  Text(
                    _getResultText(_progressValue),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _progressValue >= 0.7
                          ? Colors.green
                          : _progressValue >= 0.4
                              ? Colors.orange
                              : Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Lista de resultados
                  ...examState.questions.map((question) {
                    final userAnswer = examState.userAnswers[question.id];
                    return ResultItemWidget(
                      question: question,
                      userAnswer: userAnswer,
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildAdBanner(adState),
    );
  }

  Widget _buildAdBanner(AdBannerStateResult adState) {
    if (adState.currentScreen == 'resultScreen' &&
        adState.bannerAd != null &&
        adState.isLoaded) {
      return SizedBox(
        width: adState.bannerAd!.size.width.toDouble(),
        height: adState.bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: adState.bannerAd!),
      );
    } else {
      return const SizedBox(height: 50);
    }
  }

  String _getResultText(double progress) {
    if (progress >= 0.9) return '¡Excelente!';
    if (progress >= 0.7) return '¡Muy bien!';
    if (progress >= 0.5) return 'Buen trabajo';
    if (progress >= 0.3) return 'Puedes mejorar';
    return 'Sigue practicando';
  }
}
