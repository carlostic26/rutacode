import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rutacode/features/languages/presentation/screens/home_language_screen.dart';
import 'package:rutacode/features/loading/presentation/screens/welcome_screen.dart';
import 'package:rutacode/features/loading/presentation/state/button_loading_state_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    final btnEnabled = ref.watch(buttonState);

    bool firstWelcome = true;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: heightScreen * 0.1,
            ),
            SizedBox(
              height: heightScreen * 0.16,
              width: widthScreen * 0.35,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/logo.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightScreen * 0.02,
            ),
            SizedBox(
              height: heightScreen * 0.015,
              width: widthScreen * 0.85,
              child: LinearPercentIndicator(
                alignment: MainAxisAlignment.center,
                width: widthScreen * 0.65,
                lineHeight: 5,
                percent: 1.0,
                animation: true,
                animationDuration: 3000,
                progressColor: Colors.blueGrey,
                barRadius: const Radius.circular(10),
                onAnimationEnd: () =>
                    ref.read(buttonState.notifier).enableButton(),
              ),
            ),
            const Text(
              "Cargando recursos y contenidos...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(
              height: heightScreen * 0.18,
            ),
            TextButton(
                onPressed: () async {
                  if (btnEnabled == true) {
                    getFirstWelcome(firstWelcome, context);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: btnEnabled
                      ? WidgetStateProperty.all<Color>(Colors.blueGrey)
                      : WidgetStateProperty.all<Color>(
                          const Color.fromARGB(108, 57, 57, 57)),
                ),
                child: Text(
                  'Continuar',
                  style: TextStyle(
                      color: btnEnabled ? Colors.white : Colors.grey,
                      fontWeight:
                          btnEnabled ? FontWeight.bold : FontWeight.normal),
                ))
          ],
        ),
      ),
    );
  }

  void getFirstWelcome(bool firstWelcome, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    firstWelcome = prefs.getBool('firstWelcome') ?? true;

    if (!context.mounted) return;

    if (firstWelcome == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    } else if (firstWelcome == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeLanguageScreen()),
      );
    }
  }
}
