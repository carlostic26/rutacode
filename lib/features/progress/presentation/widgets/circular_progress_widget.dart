import 'package:flutter/material.dart';

class CircularProgressWidget extends StatelessWidget {
  final double progress;

  const CircularProgressWidget({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: height * 0.10,
            width: height * 0.10,
            child: CircularProgressIndicator(
              value: progress / 100,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.indigo),
              strokeWidth: 5,
            ),
          ),
          Text(
            '${progress.toStringAsFixed(1)}%',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
