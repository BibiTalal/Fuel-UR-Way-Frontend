import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';
import 'package:fuel_ur_way_frontend/screens/map.dart';

class RequestScreen extends StatefulWidget {
  String? fueltype;
  String? carname;

  RequestScreen({this.carname, this.fueltype});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  String? Fuel_Quantity;

  String? services;
  var Quantitycontroller = TextEditingController();
  bool? RecuestType = false;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
            Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.white,
                height: 330,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Fuel Type:${widget.fueltype} ',
                        style: TextStyle(
                            color: drawerBackgroundColor, fontSize: 22),
                      ),
                      Row(
                        children: [
                          Container(
                              width: 122,
                              child: Text(
                                '  Car Type :\n${widget.carname}',
                                style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 120,
                              child: TextFormField(
                                controller: Quantitycontroller,
                                keyboardType: TextInputType.number,
                                onSaved: (value) {
                                  Fuel_Quantity = Quantitycontroller.text;
                                },
                                style: TextStyle(fontSize: 13),
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  hintText: '   Fuel_Quantity',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  )),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<Services>(
                              value: Services.car_wish,
                              groupValue: _services,
                              onChanged: (value) {
                                setState(() {
                                  _services = value!;
                                  RecuestType = false;
                                });
                              }),
                          Container(
                            child: Image(
                              image: AssetImage('assets/images/wisher.png'),
                              fit: BoxFit.cover,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Radio<Services>(
                              value: Services.fuel,
                              groupValue: _services,
                              onChanged: (value) {
                                setState(() {
                                  _services = value!;
                                  RecuestType = false;
                                });
                              }),
                          Container(
                            child: Image(
                              image: AssetImage('assets/images/fuel.png'),
                              fit: BoxFit.cover,
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => MapScreen(
                                            fueltype: widget.fueltype,
                                            carname: widget.carname,
                                            Fuel_Quantity: Fuel_Quantity,
                                          ))); // for testing
                            },
                            child: Text(
                              'Authrise payment',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  var _services = Services.fuel;
}

enum Services { car_wish, fuel }
