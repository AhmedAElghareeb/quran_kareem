import 'meta_model.dart';

class BaseResponseModel<T> {
  final String? code;
  final String? status;
  final String? message;
  MetaModel? meta;
  final T? data;

  BaseResponseModel({
    this.code,
    this.status,
    this.message,
    this.meta,
    required this.data,
  });

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return BaseResponseModel<T>(
      code: json['code']?.toString(),
      // status: json['status'] as String,
      message: json['message'] != null ? json['message'] as String : null,
      meta: json['meta'] != null ? MetaModel.fromJson(json['meta']) : null,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'message': message,
      'data': data,
    };
  }
}

// Example usage:
// BaseResponse<User> successResponse = BaseResponse<User>.fromJson(successResponseJson, (json) => User.fromJson(json));
// BaseResponse<dynamic> errorResponse = BaseResponse<dynamic>.fromJson(errorResponseJson, (json) => json);
//"meta": {
//         "total": 7,
//         "per_page": 10,
//         "current_page": 1,
//         "last_page": 1
//     },
