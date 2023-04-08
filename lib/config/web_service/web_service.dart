import 'package:dio/dio.dart';

import '../constanst/environment.dart';

class WebService {
  static final WebService _webService = WebService._internal();
  static Dio dio = Dio();
  factory WebService() {
    return _webService;
  }

  WebService._internal();
  static Dio httpClient() {
    dio.options.baseUrl = Environment.BASE_URL;
    dio.options.headers.addAll({"content-type": "application/json"});
    dio.options.headers.addAll({"Accept": "application/json"});
    dio.options.headers.addAll({"X-Auth-Token": Environment.API_KEY});
    return dio;
  }
}