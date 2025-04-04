import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptor extends Interceptor {
  static final AppInterceptor _singleton = AppInterceptor._internal();

  factory AppInterceptor() => _singleton;

  AppInterceptor._internal();

  bool isUnauthorized = false;

  void resetUnauthorized() {
    debugPrint('Logger AppInterceptor => $isUnauthorized');
    isUnauthorized = false;
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // If a 401 has been encountered, cancel any new requests
    if (isUnauthorized) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: "Unauthorized - Stopping all further requests.",
          type: DioExceptionType.cancel,
        ),
      );
      return;
    }
    // final String? token =
    // CacheHelper.getStringData(key: CacheConstants.tokenKey);
    // final packageInfo = await PackageInfo.fromPlatform();
    options.headers['Accept'] = 'application/json';
    options.headers['Accept-Language'] = 'ar';
    // options.headers['Accept-device'] = 'mobile';
    // options.headers['Accept-Version'] = packageInfo.version;
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    debugPrint('Test => ${options.headers}');
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (!isUnauthorized) {
        // Set flag to true on first 401 error
        isUnauthorized = true;
        // Navigate to login page
        // Navigator.pushReplacementNamed(
        //   NavigationHelper.navigatorKey.currentContext!,
        //   AppRoutes.login,
        //   arguments: {'route_type': 'push'},
        // );
      }
      // Cancel the request due to authorization failure
      return;
    } else if (err.response?.statusCode == 403) {
      if (err.response != null &&
          !err.response!.realUri.path.contains('login')) {
        // Navigator.pushNamedAndRemoveUntil(
        //   NavigationHelper.navigatorKey.currentContext!,
        //   AppRoutes.login,
        //   arguments: {'route_type': 'push'},
        //       (Route<dynamic> route) => false,
        // );
      }
    }
    // if (err.response?.data['message'] != null) {
    //   ToastHelper.onShowToast(message: err.response?.data['message']);
    // }
    return handler.next(err);
  }
}