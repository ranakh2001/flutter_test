import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test1/features/model/enums/token_type.dart';
import 'package:flutter_test1/network/dio_manager/api_inspectors.dart';
import 'package:flutter_test1/network/constance_network/constance_network.dart';
import 'package:logger/logger.dart';

class DioManager {
  final Dio dio;
  final Ref ref;

  DioManager(this.ref)
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://highleveltecknology.com/doos/api/',
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
            sendTimeout: const Duration(seconds: 60),
            responseType: ResponseType.json,
            receiveDataWhenStatusError: true,
            validateStatus: (status) => true,
          ),
        ) {
    dio.interceptors.add(ApiInterceptors());
  }

  Future<Response> dioGet({
    required String url,
    TokenType tokenType = TokenType.authorization,
    Map<String, dynamic>? queryParameters,
  }) async {
    final headers = ConstanceNetwork.header(ref, tokenType);
    Logger().i("dioGet url: $url header: $headers queryParameters: $queryParameters");

    return await dio.get(
      url,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
  }

  Future<Response> dioPost({
    required String url,
    var body,
    TokenType tokenType = TokenType.contentType,
    Map<String, dynamic>? queryParameters,
  }) async {
    final headers = ConstanceNetwork.header(ref, tokenType);
    Logger().i("dioPost url: $url header: $headers");

    return await dio.post(
      url,
      data: body,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
  }

  Future<Response> dioPostForm({
    required String url,
    required Map<String, dynamic> body,
    TokenType tokenType = TokenType.multipart,
  }) async {
    final headers = ConstanceNetwork.header(ref, tokenType);
    Logger().i("dioPostForm url: $url header: $headers");

    return await dio.post(
      url,
      data: FormData.fromMap(body),
      options: Options(headers: headers),
    );
  }

  Future<Response> dioUpdate({
    required String url,
    required Map<String, dynamic> body,
    TokenType tokenType = TokenType.authorization,
  }) async {
    final headers = ConstanceNetwork.header(ref, tokenType);
    return await dio.put(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }

  Future<Response> dioDelete({
    required String url,
    Map<String, dynamic>? body,
    TokenType tokenType = TokenType.authorization,
  }) async {
    final headers = ConstanceNetwork.header(ref, tokenType);
    return await dio.delete(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }

  Future<Response> dioPutForm({
    required String url,
    required dynamic body,
    TokenType tokenType = TokenType.multipart,
  }) async {
    final headers = ConstanceNetwork.header(ref, tokenType);
    return await dio.put(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }

  Future<Response> dioPatchForm({
    required String url,
    required dynamic body,
    TokenType tokenType = TokenType.multipart,
  }) async {
    final headers = ConstanceNetwork.header(ref, tokenType);
    return await dio.patch(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }

  Future<Response> dioDownloadFile({
    required String url,
    required dynamic body,
    required String savePath,
    TokenType tokenType = TokenType.download,
  }) async {
    final headers = ConstanceNetwork.header(ref, tokenType);
    Logger().i("dioDownloadFile url: $url header: $headers");

    return await dio.download(
      url,
      savePath,
      data: body,
      options: Options(headers: headers),
      onReceiveProgress: (recieved, total) {
        if (total != -1) {
          Logger().i("${(recieved / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
  }
}
