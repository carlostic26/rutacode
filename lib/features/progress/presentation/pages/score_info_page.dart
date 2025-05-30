import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/progress/presentation/widgets/score_info_widget.dart';

class ScoreInfoPage extends ConsumerWidget {
  final String language;
  final String module;

  const ScoreInfoPage(
      {super.key, required this.language, required this.module});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ScoreInfoWidget(language: language, module: 'Jr'),
              const SizedBox(height: 20),
              ScoreInfoWidget(language: language, module: 'Mid'),
              const SizedBox(height: 20),
              ScoreInfoWidget(language: language, module: 'Sr'),
            ],
          ),
        ),
      ),
    );
  }
}
