import 'package:flutter/material.dart';
import 'package:quran_kareem/core/constants/cache_constants.dart';
import 'package:quran_kareem/core/helpers/cache_helper.dart';
import 'package:quran_kareem/core/helpers/localization_helper.dart';

abstract class AppSettings {
  static bool isArabic(BuildContext context) =>
      EasyLocalizationHelper.currentLanguage(context) == "ar";

  static String? get language =>
      CacheHelper.getStringData(key: CacheConstants.language);
}
