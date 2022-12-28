import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';
import 'package:fuel_ur_way_frontend/screens/lastpage.dart';
import 'package:fuel_ur_way_frontend/screens/payment.dart';

class MapScreen extends StatefulWidget {
  String? fueltype;
  String? carname;
  String? Fuel_Quantity;

  double? total;
  String? time;
  DateTime? date;
  String? extraService;
  MapScreen({
    this.fueltype,
    this.carname,
    this.Fuel_Quantity,
    this.total,
    this.time,
    this.date,
    this.extraService,
  });
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var bloccontroller = TextEditingController();
  var strrtcontroller = TextEditingController();
  var buildingnumbercontroller = TextEditingController();
  String? Block;
  String? Street;
  String? Buildingn;
  bool? PaymentType = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/map.png"), fit: BoxFit.cover)),
        child: SafeArea(
          child: Stack(
            children: [
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
                          'Address',
                          style: TextStyle(
                              color: drawerBackgroundColor, fontSize: 22),
                        ),
                        Text('Enter your Address'),
                        governateList(context),
                        Row(
                          children: [
                            Container(
                                width: 120,
                                child: TextFormField(
                                  controller: bloccontroller,
                                  onChanged: (value) {
                                    Block = value;
                                  },
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 13),
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    hintText: '   City & Block',
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
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                width: 120,
                                child: TextFormField(
                                  controller: strrtcontroller,
                                  onChanged: (value) {
                                    Street = value;
                                  },
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(fontSize: 13),
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    hintText: '   Street',
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
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              controller: buildingnumbercontroller,
                              onChanged: (value) {
                                Buildingn = value;
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 13),
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                hintText: '  Building number/name',
                                hintStyle: TextStyle(
                                  color: Color(0xff939823),
                                ),
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
                        Row(
                          children: [
                            Radio<Payment>(
                                value: Payment.Cash,
                                groupValue: _Payment,
                                activeColor: Color.fromARGB(255, 0, 0, 0),
                                onChanged: (value) {
                                  setState(() {
                                    _Payment = value!;
                                    PaymentType = false;
                                  });
                                }),
                            Text('Cash'),
                            SizedBox(
                              width: 40,
                            ),
                            Radio<Payment>(
                                value: Payment.Visa,
                                groupValue: _Payment,
                                activeColor: Color.fromARGB(255, 0, 0, 0),
                                onChanged: (value) {
                                  setState(() {
                                    PaymentType = true;
                                    _Payment = value!;
                                  });
                                }),
                            Container(
                              child: Image(
                                image: AssetImage('assets/images/card.png'),
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
                                var address = bloccontroller.text +
                                    strrtcontroller.text +
                                    buildingnumbercontroller.text;
                                if (PaymentType!) {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => PaymentScreen(
                                              fueltype: widget.fueltype,
                                              carname: widget.carname,
                                              Fuel_Quantity:
                                                  widget.Fuel_Quantity,
                                              Payment: _Payment,
                                              Address: address,
                                              total: widget.total,
                                              //time:widget.time,
                                              date: widget.date)));
                                } else {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => LastScreen()));
                                }
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
      ),
    );
  }

  String dropdownvalue = 'Governate';
  var items = [
    'Governate',
    'Al Jahra',
    'Farwaniya',
    'Al Ahmadi',
    'Al Asmaa',
    'Hawally',
    'Mubarak Al Kabeer'
  ];
  Widget governateList(BuildContext context) => DropdownButton(
        // Initial Value
        value: dropdownvalue,

        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
      );
  var _Payment = Payment.Cash;
}

enum Payment { Cash, Visa }
