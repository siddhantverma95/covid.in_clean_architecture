import 'dart:convert';
import 'dart:io';

import 'package:covid_in/core/error/exceptions.dart';
import 'package:covid_in/core/error/network_exception.dart';
import 'package:covid_in/core/network/dio_config.dart';
import 'package:dio/dio.dart';

abstract class DioHttpRequest{
  Future<dynamic> getApi({String url, Map<String, dynamic> data});
}

class DioHttpRequestImpl extends DioHttpRequest{
  final DioConfig dioConfig;

  DioHttpRequestImpl(this.dioConfig): assert(dioConfig!=null);
  @override
  Future getApi({String url, Map<String, dynamic> data}) async {
    var responseJson;
    try {
      final response = await dioConfig.getDioClient().get(url, queryParameters: data);
      responseJson = _response(response);
    } on SocketException {
      throw ServerException();
    }
    return responseJson;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
        //throw InternalServerException(response.statusCode);
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}