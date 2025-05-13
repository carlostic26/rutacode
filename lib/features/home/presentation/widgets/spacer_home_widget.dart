import 'package:flutter/material.dart';

class SpacerHomeWidget extends StatelessWidget {
  const SpacerHomeWidget({
    super.key,
    required this.heightScreen,
  });

  final double heightScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightScreen * 0.07,
    );
  }
}
