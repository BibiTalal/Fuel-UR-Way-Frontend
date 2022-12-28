import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:fuel_ur_way_frontend/providers/dio_helper.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class AuthProvider extends ChangeNotifier {
  String? username;

  Future<bool> hasToken() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");

    if (token == null || JwtDecoder.isExpired(token)) {
      print('removed token'); // for testing
      return false;
    }

    var tokenMap = JwtDecoder.decode(token);
    username = tokenMap['username'];
    notifyListeners();
    print(username); // for testing
    return true;
  }

  Future<bool> loginData(
      {required String username, required String password}) async {
    late String access;
    try {
      Response response = await DioHelper.dio!.post('/signin/', data: {
        "username": username,
        "password": password,
      });
      access = response.data["access"];
      DioHelper.dio!.options.headers["Authorization"] = "Bearer $access";
      var ref = await SharedPreferences.getInstance();
      ref.setString("token", access);
      this.username = username;
      notifyListeners();
      return true;
    } on DioError catch (error) {
      print(error);
    }
    notifyListeners();

    return false;
  }

  Future<bool> UserRegister(
      {required String username,
      required String email,
      required String password}) async {
    try {
      var response = await DioHelper.dio!.post("/register/", data: {
        'username': username,
        'password': password,
      });

      var token = response.data["access"];

      DioHelper.dio!.options.headers[HttpHeaders.authorizationHeader] =
          "Bearer $token";
      this.username = username;
      notifyListeners();

      var pref = await SharedPreferences.getInstance();
      await pref.setString("token", token);
      print('register successfully');
      return true;
    } on DioError catch (e) {
      print(e.response!.data);
    } catch (e) {
      print("Unknown Error");
    }

    return false;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    this.hasToken(); // for testing
    // token = "";
    this.username = null;
    notifyListeners();
  }

  _save(String access) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = access;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
