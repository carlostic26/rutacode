import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/exam/presentation/screens/exam_screen.dart';
import 'package:rutacode/features/progress/presentation/state/start_exam_provider.dart';

class StartExamScreen extends ConsumerStatefulWidget {
  final String moduleId;

  const StartExamScreen({required this.moduleId, super.key});

  @override
  ConsumerState<StartExamScreen> createState() => _StartExamScreenState();
}

class _StartExamScreenState extends ConsumerState<StartExamScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentStep = 0;
  final List<Map<String, dynamic>> _steps = [
    {'text': 'Examen de conocimientos para', 'duration': 2, 'zoom': false},
    {'text': '¿Estás listo?', 'duration': 1, 'zoom': true},
    {'text': '3', 'duration': 1, 'zoom': true},
    {'text': '2', 'duration': 1, 'zoom': true},
    {'text': '1', 'duration': 1, 'zoom': true},
    {'text': 'Comencemos!', 'duration': 1, 'zoom': true}
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _steps[_currentStep]['duration']),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _nextStep();
        }
      });

    _startAnimation();
  }

  void _startAnimation() {
    _controller.forward(from: 0);
  }

  void _nextStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
        _controller.duration =
            Duration(seconds: _steps[_currentStep]['duration']);
      });
      _controller.forward(from: 0);
    } else {
      // Obtener el provider específico para este módulo y actualizar su estado
      final examProvider = ref.read(examProviderSelector(widget.moduleId));
      ref.read(examProvider.notifier).state = true;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ExamScreen(moduleId: widget.moduleId),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final currentStep = _steps[_currentStep];

            return _currentStep == 0
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        currentStep['text'],
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Flutter ${widget.moduleId}',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : Transform.scale(
                    scale: currentStep['zoom']
                        ? _controller.value * 0.5 + 0.8
                        : 1.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currentStep['text'],
                          style: TextStyle(
                            fontSize: _currentStep >= 2 && _currentStep <= 4
                                ? 64
                                : 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (_currentStep == _steps.length - 1)
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: CircularProgressIndicator(
                              color: Colors.blue[300],
                            ),
                          ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
