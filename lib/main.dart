import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/common/core/ads/ads_manager.dart';
import 'package:rutacode/common/core/theme/theme_manager.dart';
import 'package:rutacode/common/core/theme/theme_notifier.dart';
import 'package:rutacode/features/exam/data/datasources/local_exam_data_source.dart';
import 'package:rutacode/features/loading/presentation/screens/loading_screen.dart';
import 'package:rutacode/features/progress/data/datasources/progress_local_database.dart';

AppOpenAd? openAd;
bool isAdLoaded = false;

Future<void> loadOpenAd() async {
  RutaAdsIds rutaCodeAds = RutaAdsIds();
  try {
    await AppOpenAd.load(
      adUnitId: rutaCodeAds.openApp_adUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          openAd = ad;
          openAd!.show();
          isAdLoaded = true;
        },
        onAdFailedToLoad: (error) {
          isAdLoaded = false;
        },
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  } catch (e) {
    //print('Error loading open ad: $e');
    isAdLoaded = false;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  LocalContentDatabaseHelper().getDatabase();
  ProgressLocalContentDatabaseHelper().getDatabase;
  LocalExamDataSource().getDatabase();

  await dotenv.load(fileName: '.env');

  await loadOpenAd();

  Timer(const Duration(seconds: 12), () async {
    if (!isAdLoaded) {
      openAd?.dispose();
    }
  });

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RutaCode',
        theme: isDarkMode ? ThemeManager.darkTheme : ThemeManager.lightTheme,
        home: const LoadingScreen());
  }
}
