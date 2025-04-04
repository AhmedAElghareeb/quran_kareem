import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quran_kareem/core/constants/api_endPoints.dart';
import 'package:quran_kareem/core/utils/app_interceptor.dart';
import 'package:quran_kareem/src/data/services/surah_sevice.dart';
import 'package:quran_kareem/src/data/services/surah_sevice.dart';

final GetIt locator = GetIt.I;

Future<void> setupDi() async {
  if (kDebugMode) {
    locator.registerLazySingleton<PrettyDioLogger>(() => PrettyDioLogger());
    locator.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: ApiEndPoints.baseUrl,
          contentType: 'application/json',
        ),
      )..interceptors.addAll(
          [
            locator<PrettyDioLogger>(),
            AppInterceptor(),
          ],
        ),
    );
  } else {
    locator.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: ApiEndPoints.baseUrl,
          contentType: 'application/json',
        ),
      )..interceptors.addAll([AppInterceptor()]),
    );
  }

  ///Services
  locator.registerLazySingleton<SurahService>(() => SurahService());
}
