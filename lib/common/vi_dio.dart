import 'package:dio/dio.dart';
import 'package:flutter_agora/common/values/server.dart';

///dio二次封装
class ViDio {
  //singleton for this class itself
  ///public it for extenal invoke
  factory ViDio() => _viDio;
  static final ViDio _viDio = ViDio._();
  ViDio._() {
    //real initialize place
    //set base_url globally for every request
    BaseOptions baseOptions = BaseOptions(
      baseUrl: base_url,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    _dio = Dio(baseOptions);
  }

  ///dio instance
  late final Dio _dio;

  ///get
  Future<String> get({
    required String path,
    Map<String, dynamic>? para,
  }) async {
    Response res = await _dio.get(
      path,
      queryParameters: para,
    );
    return res.data;
  }
}
