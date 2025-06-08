/*
https://developers.google.com/admob/android/test-ads?hl=es-419
*/
import 'package:flutter_dotenv/flutter_dotenv.dart';

//test

/* class RutaAdsIds {
  String banner_adUnitId = dotenv.env["BANNER_AD_UNIT_ID_TEST"]!;

  String openApp_adUnitId = dotenv.env["OPEN_APP_AD_UNIT_ID_TEST"]!;

  String interstitial_adUnitId = dotenv.env["INTERSTITIAL_AD_UNIT_ID_TEST"]!;

  String reward_adUnitId = dotenv.env["REWARD_AD_UNIT_ID_TEST"]!;
}    */

class RutaAdsIds {
  String banner_adUnitId = dotenv.env["BANNER_AD_UNIT_ID"]!;

  String openApp_adUnitId = dotenv.env["OPEN_APP_AD_UNIT_ID"]!;

  String interstitial_adUnitId = dotenv.env["INTERSTITIAL_AD_UNIT_ID"]!;

  String reward_adUnitId = dotenv.env["REWARD_AD_UNIT_ID"]!;
}
