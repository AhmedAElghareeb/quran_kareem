import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
import 'package:quran_kareem/core/network/dio_helper.dart';
import 'package:quran_kareem/src/data/models/base_response_model.dart';
import 'package:quran_kareem/src/data/models/error_model.dart';

mixin ApiManager<T> {
  Future<Either<ErrorModel, X>> handleApiRequest<X>(
      Future<X> Function() apiCall) async {
    try {
      return Right(await apiCall());
    } on DioException catch (exception) {
      // if (kDebugMode) rethrow;
      final String dioMessage = DioHelper.getDioExceptionMessage(
        dioExceptionType: exception.type,
        response: exception.response,
        error: (exception.response?.data.runtimeType == String)
            ? exception.response?.data?.toString()
            : (exception.response?.data['message'] ??
                exception.error.toString()),
      );
      return Left(
        ErrorModel(
          message: dioMessage,
          code: exception.response?.statusCode?.toString(),
        ),
      );
    } catch (e) {
      // if (kDebugMode) rethrow;
      return Left(ErrorModel(message: e.toString()));
    }
  }

  T handleResponseError(Response response, int responseStatusCode, T? value) {
    try {
      if (response.statusCode == responseStatusCode) {
        return value!;
      } else {
        final String dioMessage = DioHelper.getStatusExceptionMessage(
            response: response, error: response.data['message']);
        final BaseResponseModel<String> errorResponse =
            BaseResponseModel<String>.fromJson(response.data, (json) => json);
        throw ErrorModel(message: errorResponse.message ?? dioMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  String handleQueryParams({
    required Map<String, String?> queryParams,
  }) {
    final String queryString = queryParams.entries
        .where((entry) => entry.value != null)
        .map((entry) => '${entry.key}=${Uri.encodeComponent(entry.value!)}')
        .join('&');

    return queryString;
  }

  Future<Either<ErrorModel, X>> handleRequest<X>({
    RequestType requestType = RequestType.get,
    required int responseStatusCode,
    required String url,
    Map<String, dynamic>? data,
    X? value,
  }) async {
    try {
      late Response response;
      switch (requestType) {
        case RequestType.get:
          response = await DioHelper.getData(url: url);
          break;
        case RequestType.post:
          response = await DioHelper.postData(url: url, data: data);
          break;
        case RequestType.put:
          response = await DioHelper.putData(url: url, data: data);
          break;
        case RequestType.delete:
          response = await DioHelper.deleteData(url: url, data: data);
          break;
      }
      if (response.statusCode == responseStatusCode) {
        return Right(value as X);
      } else {
        final String dioMessage = DioHelper.getStatusExceptionMessage(
            response: response, error: response.data['message']);
        final BaseResponseModel<String> errorResponse =
            BaseResponseModel<String>.fromJson(response.data, (json) => json);
        return Left(ErrorModel(message: errorResponse.message ?? dioMessage));
      }
    } on DioException catch (exception) {
      final String dioMessage = DioHelper.getDioExceptionMessage(
        dioExceptionType: exception.type,
        response: exception.response,
        error:
            exception.response?.data['message'] ?? exception.error.toString(),
      );
      return Left(ErrorModel(message: dioMessage));
    } catch (e) {
      return Left(ErrorModel(message: e.toString()));
    }
  }
}

enum RequestType { get, post, put, delete }
