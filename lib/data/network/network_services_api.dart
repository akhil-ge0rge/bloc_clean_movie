import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean/data/exceptions/app_exceptions.dart';
import 'package:bloc_clean/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 15));
      final jsonResponse = returnResponse(response);
      return jsonResponse;
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeOutException('');
    }
  }

  @override
  Future<dynamic> postApi(String url, data) async {
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 15));
      final jsonResponse = returnResponse(response);
      return jsonResponse;
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeOutException('');
    }
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    try {
      final response = await http
          .delete(
            Uri.parse(url),
          )
          .timeout(const Duration(seconds: 15));
      final jsonResponse = returnResponse(response);
      return jsonResponse;
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeOutException('');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic res = jsonDecode(response.body);
        return res;
      case 400:
        dynamic res = jsonDecode(response.body);
        return res;
      case 500:
        throw FetchingDataException(
            'Error While Communicating With Server ${response.statusCode}');
      case 401:
        throw UnAuthorizedException();
      default:
        throw UnAuthorizedException();
    }
  }
}
