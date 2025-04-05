import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/utils/app_settings.dart';
import 'package:quran_kareem/core/utils/observer.dart';
import 'package:quran_kareem/src/quran_app.dart';
import 'package:quran_kareem/src/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupDi();
  Bloc.observer = MyAppObserver();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: Locale(AppSettings.language ?? 'ar'),
      saveLocale: true,
      child: const QuranKareem(),
    ),
  );
}
