import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:fuel_ur_way_frontend/models/order.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://127.0.0.1:8000",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'application': 'text/html',
      'Authorization': token ?? '',
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      "application": "text/html",
      'Authorization': token ?? '',
    };

    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<List<Ordermodel>> getOrder() async {
    var url = Uri.parse("http://127.0.0.1:8000");

    final response = await http.get(
      url,
    );
    final body = json.decode(response.body);
    return body.map<Ordermodel>(Ordermodel.fromJson).toList();
  }
}
