import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:fuel_ur_way_frontend/providers/dio_helper.dart';
import 'package:fuel_ur_way_frontend/models/user.dart';

class AuthProvider extends ChangeNotifier {
  String serverUrl = "http://10.0.2.2:8000/";
  var status;
  String? username;
  var token;
  String? Block;
  String? address;
  String? Street;
  String? carname;

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

  Future<void> loginData(
      {required String username, required String password}) async {
    String myUrl = "$serverUrl/signin/";

    DioHelper.postData(url: myUrl,
            // token:DioHelper.dio!.options.headers["Authorization"] ,
            data: {"username": "$username", "password": "$password"})
        .then((value) => {user = User.fromJson(value.data)})
        .catchError((e) {
      print(e.toString());
    });
  }

  User? user;
  Future<void> UserRegister(
      {required String username,
      required String email,
      required String password}) async {
    String myUrl = "$serverUrl/register/";
    DioHelper.postData(url: myUrl, data: {
      "username": "$username",
      "email": "$email",
      "password": "$password"
    }).then((value) => {user = User.fromJson(value.data)}).catchError((e) {
      print(e.toString());
    });
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
