import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fuel_ur_way_frontend/models/order.dart';

class Saved extends StatefulWidget {
  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  String? username = 'bibi';

  Future<List<Ordermodel>> getRequest() async {
    //replace your restFull API here.
    String url = "http://127.0.0.1:8000/get/order/?username=$username";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Ordermodel> cars = [];
    for (var singleCar in responseData) {
      Ordermodel car = Ordermodel(
        id: singleCar["id"],
        carType: singleCar["carType"],
        fuelType: singleCar["fuelType"],
        user: singleCar["user"],
      );

      //Adding user to the list.
      cars.add(car);
    }
    return cars;
  }

  getMethod() async {
    String? theurl = 'http://127.0.0.1:8000/userList/order/$username/';
    final res = await http
        .get(Uri.parse(theurl), headers: {'Content-Type': 'application/json'});
    var responsbody = json.decode(res.body);
    print(responsbody);
    return responsbody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image(
                      image: AssetImage('assets/images/smalllogo.png'),
                      fit: BoxFit.contain,
                      height: 60,
                      width: 160,
                    ),
                    Image(
                      image: AssetImage('assets/images/name.png'),
                      fit: BoxFit.contain,
                      height: 120,
                      width: 260,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: FutureBuilder(
                    future: getRequest(),
                    builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                      List snap = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting ||
                          snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        Center(child: Text("Error fetching data"));
                      }

                      return SingleChildScrollView(
                        child: SizedBox(
                          height: 700,
                          child: ListView.builder(
                            itemCount: snap.length,
                            itemBuilder: (ctx, index) => ListTile(
                              title: Text(snap[index]['carType']),
                              subtitle: Text(snap[index]['carType']),
                              contentPadding: EdgeInsets.only(bottom: 20.0),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildResultCard(data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(data['name']),
          subtitle: Text("Rs.${data['price']}"),
        ),
        Divider(color: Colors.black)
      ],
    ),
  );
}
