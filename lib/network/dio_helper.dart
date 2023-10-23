import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jokelaugh/constants/app_constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    if (dio != null) {
      return;
    } else {
      dio = Dio(
        BaseOptions(
          baseUrl: AppConstants.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        ),
      );
    }
  }

  static Future<Response?> getAllJokes(String endPoint) async {
    return await dio
        ?.get(endPoint, queryParameters: {"type": "single", "amount": "10"});
  }
}
