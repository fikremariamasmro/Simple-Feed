import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_feed/data/api/api.dart';
import 'package:simple_feed/data/data.dart';

import '../../app.dart';

class HttpService {
  Dio _dio;
  UserRepository userRepository = UserRepository();

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiRoutes.baseUrl,
    ));
    initInterceptor();
  }

  _getAccessTokne() async {
    return await userRepository.getToken();
  }

  initInterceptor() async {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error) async {
      if (error.response?.statusCode == 403 ||
          error.response?.statusCode == 401) {
        await userRepository.signOut();
        AuthenticationBloc(userRepository: userRepository)
          ..add(AppStartedEvent());
      }
    }, onRequest: (request) async {
      request.headers = {
        'Authorization': await _getAccessTokne(),
        'Content-Type': 'application/json'
      };
    }, onResponse: (response) {
      return response;
    }));
  }

  Future<Response> get({@required String path}) async {
    Response response;
    try {
      response = await _dio.get(path);
    } on DioError catch (e) {
      response = e.response;
    }
    return response;
  }

  Future<Response> put({@required String path, Map params}) async {
    Response response;
    try {
      response = await _dio.put(path, queryParameters: params);
    } on DioError catch (e) {
      debugPrint('Dio Put Error: ${e.message}');
      response = e.response;
    }
    return response;
  }

  Future<Response> post({@required String path, FeedFormModel data}) async {
    String fileName = data.image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "caption": data.caption,
      "image":
          await MultipartFile.fromFile(data.image.path, filename: fileName),
    });
    Response response;
    try {
      response = await _dio.post(path, data: formData);
    } on DioError catch (e) {
      response = e.response;
    }
    return response;
  }
}
