import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hire_app/service/response_handler.dart';

import '../main.dart';
import 'end_points.dart';

class DioClient {
  final Dio _dio = Dio();
  final timeout = const Duration(minutes: 2);
  DioClient({String? baseUrl}) {
    _dio
      ..options.baseUrl = baseUrl ?? EndPoints.baseUrl
      ..options.responseType = ResponseType.json
      ..options.connectTimeout = timeout
      ..options.responseType = ResponseType.plain
      // ..interceptors.add(alice.getDioInterceptor())
      ..options.receiveTimeout = timeout;
  }

  Future<ApiResponse> get(
    String url, {
    Map<String, dynamic>? queryParam,
    ProgressCallback? onResponse,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      debugPrint("url :${_dio.options.baseUrl}$url ");
      debugPrint("Param: $queryParam");
      final response = await _dio.get(
        url,
        queryParameters: queryParam,
        options: options,
        cancelToken: cancelToken,
      );
      debugPrint('res: ${response.data}');
      return DioResponse(response);
    } catch (e) {
      // debugPrint("$e");
      return DioExceptions.fromDioError(e as DioException);
    }
  }

  Future<ApiResponse> post(
    String url,
    data, {
    Map<String, dynamic>? queryParam,
    ProgressCallback? onResponse,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      debugPrint("url :${_dio.options.baseUrl}$url \n req: $data");
      debugPrint("Param: $queryParam");

      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParam,
        options: options,
        cancelToken: cancelToken,
      );

      debugPrint('res: ${response.data}');

      return DioResponse(response);
    } catch (e) {
      // debugPrint(e.toString());
      return DioExceptions.fromDioError(e as DioException);
    }
  }
}
