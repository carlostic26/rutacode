import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/common/core/ads/banner/ad_banner_provider_exam.dart';
import 'package:rutacode/common/core/services/shared_preferences_service.dart';
import 'package:rutacode/features/exam/presentation/screens/result_screen.dart';
import 'package:rutacode/features/exam/presentation/screens/start_exam_screen.dart';
import 'package:rutacode/features/exam/presentation/state/provider/exam_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/question_widget.dart';
import '../widgets/timer_widget.dart';

class ExamScreen extends ConsumerStatefulWidget {
  final String language;
  final String module;

  const ExamScreen({required this.language, required this.module, super.key});

  Future<void> navigate(BuildContext context, String module) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            StartExamScreen(language: language, module: module),
      ),
    );
  }

  @override
  ConsumerState<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends ConsumerState<ExamScreen> {
  late PageController _pageController;
  String? _selectedAnswer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    ref
        .read(examStateProvider.notifier)
        .loadQuestions(widget.language, widget.module);

    // Inicializar el banner después de que el widget esté construido
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setDataExam();

      ref.read(adBannerProviderExam.notifier).loadAdaptiveAd(
            context,
            screenId: 'examScreen',
          );
    });
  }

  void setDataExam() {
    //aqui registro los datos o parametros de guardado
    ref.read(examLanguageSelectedProvider.notifier).state = widget.language;
    ref.read(examModuleSelectedProvider.notifier).state = widget.module;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(examStateProvider.notifier).resetExamState();
        ref.read(adBannerProviderExam.notifier).disposeCurrentAd();
      }
    });
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final examState = ref.watch(examStateProvider);
    final adState = ref.watch(adBannerProviderExam);
    final screenSize = MediaQuery.of(context).size;

    if (examState.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
            title: const Text('Examen Final'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                ref.read(examStateProvider.notifier).resetExamState();
                Navigator.pop(context);
              },
            )),
        body: const Center(child: Text('No hay preguntas disponibles.')),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          ref.read(examStateProvider.notifier).resetExamState();
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${widget.language} - ${widget.module}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          leading: IconButton(
            icon: const Icon(Icons.highlight_off, color: Colors.red),
            onPressed: () {
              ref.read(examStateProvider.notifier).resetExamState();
              Navigator.pop(context);
            },
          ),
          actions: [
            Row(
              children: [
                Container(
                  height: 8,
                  width: screenSize.width * 0.42,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: (examState.currentQuestionIndex + 1) /
                          examState.questions.length,
                      backgroundColor: Colors.transparent,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    '${examState.currentQuestionIndex + 1}/${examState.questions.length}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: screenSize.height * 0.065),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: examState.questions.length,
                    itemBuilder: (context, index) {
                      return QuestionWidget(
                        question: examState.questions[index],
                        selectedAnswer: _selectedAnswer,
                        onAnswerSelected: (answer) =>
                            setState(() => _selectedAnswer = answer),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
                  child: SizedBox(
                    width: screenSize.width,
                    height: screenSize.height * 0.06,
                    child: ElevatedButton(
                      onPressed: _selectedAnswer == null
                          ? null
                          : () => _handleAnswer(examState),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedAnswer == null
                            ? Colors.grey
                            : Colors.indigo,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        examState.currentQuestionIndex + 1 ==
                                examState.questions.length
                            ? 'Finalizar'
                            : 'Continuar',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: screenSize.height * 0.025,
              left: screenSize.width * 0.42,
              child: const TimerWidget(),
            ),
          ],
        ),
        bottomNavigationBar: _buildAdBanner(adState),
      ),
    );
  }

  Widget _buildAdBanner(AdBannerStateExam adState) {
    if (adState.currentScreen == 'examScreen' &&
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

  void _handleAnswer(ExamState examState) async {
    ref.read(examStateProvider.notifier).saveAnswer(
          examState.questions[examState.currentQuestionIndex].id,
          _selectedAnswer!,
        );

    if (examState.currentQuestionIndex + 1 == examState.questions.length) {
      ref.read(examStateProvider.notifier).finishExamEarly();

      final prefs = await SharedPreferences.getInstance();
      final sharedPrefsService = SharedPreferencesService(prefs);
      await sharedPrefsService.markExamAsCompleted(
          widget.language, widget.module);

      ref.read(examLanguageSelectedProvider.notifier).state = widget.language;
      ref.read(examModuleSelectedProvider.notifier).state = widget.module;

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ResultsScreen()),
        );
      }
    } else {
      ref.read(examStateProvider.notifier).nextQuestion();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() => _selectedAnswer = null);
    }
  }
}
