import 'dart:io';

import 'package:dio/dio.dart';
import 'package:health_flex/app/data/models/custom_exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class APIController {
  Dio _dio = Dio();

  void init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://api.giphy.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    _dio.options = baseOptions;
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  CustomException _handleError(DioException e) {
    if (e is SocketException) {
      return CustomException(error: 'No internet connnection');
    } else {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return CustomException(error: 'Server timeout');
        default:
          return CustomException(error: 'Something went wrong');
      }
    }
  }
}
