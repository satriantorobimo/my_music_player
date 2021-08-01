import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkUtil {
  factory NetworkUtil() => _instance;
  NetworkUtil.internal();

  static final NetworkUtil _instance = NetworkUtil.internal();

  final JsonDecoder _decoder = const JsonDecoder();

  String newAccessToken = '';

  Future<dynamic> get(String url, {Map<String, dynamic> headers}) async {
    return http.get(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403 ||
          statusCode == 400) {
        return _decoder.convert(res);
      } else {
        throw Exception(res);
      }
    }).catchError((dynamic err) {
      throw Exception(err);
    }); //.timeout(Duration(milliseconds: 10000));
  }
}
