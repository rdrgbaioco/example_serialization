import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpClient {
  final Dio _dio;
  HttpClient({required Dio httpClient}) : _dio = httpClient;


  FutureOr<dynamic> get({required String path}) async {
    try {
      Response response = await _dio.get(path);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (error) {
      debugPrint(error.error.toString());
      throw Error();
    }
  }
}