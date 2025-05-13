import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/home/presentation/screens/home_page_screen.dart';
import 'package:rutacode/features/home/presentation/screens/home_screen.dart';
import 'package:rutacode/features/loading/presentation/state/page_view_state_provider.dart';
import 'package:rutacode/features/loading/presentation/widgets/tutorial_page_widget.dart';
import 'package:rutacode/features/loading/presentation/widgets/welcome_page_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    final pageController = PageController();
    int numberPage = ref.watch(pageProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
                controller: pageController,
                onPageChanged: (int page) {
                  ref.read(pageProvider.notifier).setPage(page);
                },
                children: [
                  WelcomePageWidget(
                      heightScreen: heightScreen, widthScreen: widthScreen),
                  TutorialPageWidget(
                      heightScreen: heightScreen, widthScreen: widthScreen),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                iconSize: 30,
                onPressed: () async {
                  if (numberPage == 0) {
                    nextPage(pageController);
                  }

                  if (numberPage == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePageScreen()));

                    setFisrtWelcome();
                  }
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PageController nextPage(pageController) {
    return pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void setFisrtWelcome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('firstWelcome', false);
  }
}
