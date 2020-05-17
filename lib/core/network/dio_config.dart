
import 'package:dio/dio.dart';

abstract class DioConfig {
  Dio getDioClient();
}

class DioConfigImpl implements DioConfig{
  Dio dio;
  @override
  Dio getDioClient() {
    var options = BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 30000,
        headers: {"Content-Type": "application/json"});
    dio = Dio(options);
    return dio;
  }
  
  
}