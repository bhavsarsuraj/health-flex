import 'package:dio/dio.dart';
import 'package:health_flex/app/data/models/custom_exception.dart';

class APIController {
  late Dio _dio;

  void init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://api.giphy.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    _dio = Dio(baseOptions);
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
    //TODO:
    return CustomException(error: 'Something went wrong');
  }
}
