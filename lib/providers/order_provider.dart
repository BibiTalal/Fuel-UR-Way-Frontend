import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:fuel_ur_way_frontend/models/order.dart';
import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/providers/dio_helper.dart';

class OrderProvider extends ChangeNotifier {
  Ordermodel? order;
  bool loading = false;
  String serverUrl = "http://10.0.2.2:8000/";
  getorderData() async {
    loading = true;
    order = (await getSinglePostData());
    loading = true;
    notifyListeners();
  }

  void postData({
    required String user,
    required String carType,
    required String fuelType,
    required String litter,
    required String address,
    required String date,
    required String time,
    required String price,
    required String payed,
    required String status,
  }) async {
    String myUrl = "$serverUrl/create/order";
    final response = await DioHelper.postData(url: myUrl, data: {
      "user": user,
      "carType": carType,
      "fuelType": fuelType,
      "litter": litter,
      "address": address,
      "date": date,
      "time": time,
      "price": price,
      "payed": payed,
      "status": status,
    }).then((value) {
      order = Ordermodel.fromJson(value.data);
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<Ordermodel?> getSinglePostData() async {
    Ordermodel? result;
    try {
      final response = await http.get(
        Uri.parse("http://10.0.2.2:8000/list/order/"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = Ordermodel.fromJson(item);
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}
