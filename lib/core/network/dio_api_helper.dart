import 'package:dio/dio.dart';
import 'package:mega_ecommerce_app/core/constants/api_constants.dart';
import 'package:mega_ecommerce_app/core/domain/use_cases/cached_token_use_cases/get_token_use_case.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'api_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioApiHelper implements ApiHelper {
  final Dio _dio;
  final GetTokenUseCase getTokenUseCase;
  DioApiHelper({Dio? dio, required this.getTokenUseCase})
    : _dio =
          (dio ?? Dio())
            ..options = BaseOptions(
              baseUrl: ApiConstants.baseUrl,
              connectTimeout: const Duration(seconds: 50),
              receiveTimeout: const Duration(seconds: 50),
              sendTimeout: const Duration(seconds: 50),
              headers: {
                //'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
            )
            ..interceptors.add(
              PrettyDioLogger(requestHeader: true, requestBody: true),
            );

  //////////////////// get ////////////////////
  @override
  Future<dynamic> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      await _addTokenToHeaders();
      final response = await _dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e) {
      throw ExceptionsHandler(object: e).map;
    }
  }

  //////////////////// post ////////////////////
  @override
  Future<dynamic> postRequest({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      await _addTokenToHeaders();
      final response = await _dio.post(
        endPoint,
        data: body,
        // options: Options(headers: headers),
      );
      return response.data;
    } catch (e) {
      throw ExceptionsHandler(object: e).map;
    }
  }

  //////////////////// put ////////////////////
  @override
  Future<dynamic> putRequest({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool isFormData = false,
  }) async {
    try {
      await _addTokenToHeaders();

      final data = isFormData && body != null ? FormData.fromMap(body) : body;

      final response = await _dio.put(
        endPoint,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } catch (e) {
      throw ExceptionsHandler(object: e).map;
    }
  }

  //////////////////// delete ////////////////////
  @override
  Future<dynamic> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      await _addTokenToHeaders();
      final response = await _dio.delete(
        endPoint,
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e) {
      throw ExceptionsHandler(object: e).map;
    }
  }

  Future<void> _addTokenToHeaders() async {
    final token = await getTokenUseCase();
    token.fold((l) {}, (data) {
      if (data != null) {
        _dio.options.headers.remove('Authorization');
        _dio.options.headers.putIfAbsent(
          'Authorization',
          () => 'Bearer ${data.token}',
        );
      } else {
        _dio.options.headers.remove('Authorization');
      }
    });
  }
}
