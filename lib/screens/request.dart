import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';
import 'package:fuel_ur_way_frontend/screens/map.dart';
import 'package:fuel_ur_way_frontend/widgets/components.dart';
import 'package:intl/intl.dart';

class RequestScreen extends StatefulWidget {
  String? fueltype;
  String? carname;
  double? price;

  RequestScreen({this.carname, this.fueltype, this.price});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  String? extraService;

  int? Fuel_Quantity;

  double? total;
  var Quantitycontroller = TextEditingController();
  bool? RecuestType = false;
  bool iswasher = false;
  bool isOil = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  DateTime? dateday;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
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
              SizedBox(
                height: 50,
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  color: Colors.white,
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'The Fuel Type:  ',
                              style: TextStyle(
                                  color: drawerBackgroundColor, fontSize: 16),
                            ),
                            Text(
                              ' ${widget.fueltype} ',
                              style: TextStyle(color: Colors.red, fontSize: 22),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                width: 122,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Car Type :',
                                        style: TextStyle(
                                          fontSize: 13,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      Text(
                                        '${widget.carname}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.red,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                width: 120,
                                child: TextFormField(
                                  controller: Quantitycontroller,
                                  onFieldSubmitted: (value) {
                                    double Q =
                                        double.parse(Quantitycontroller.text);

                                    setState(() {
                                      Quantitycontroller.text = value;
                                      total = widget.price! * Q;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  onSaved: (String? value) {
                                    Quantitycontroller.text = value!;

                                    widget.price =
                                        widget.price! * double.parse(value);
                                  },
                                  style: TextStyle(fontSize: 13),
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    hintText: '   Fuel Quantity',
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
                        SizedBox(height: 15),
                        defaultTextForm(
                          prefix: Icons.watch_later_outlined,
                          valdaitefun: (val) {
                            if (val!.isEmpty) {
                              return 'time is empty';
                            }
                            return null;
                          },
                          controller: timeController,
                          labelText: 'Choose the Time',
                          type: TextInputType.datetime,
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              timeController.text =
                                  value!.format(context).toString();
                            });
                            dateday = DateTime.parse(dateController.text);
                          },
                        ),
                        SizedBox(height: 15),
                        defaultTextForm(
                          prefix: Icons.calendar_today,
                          valdaitefun: (val) {
                            if (val!.isEmpty) {
                              return 'Date is empty';
                            }
                            return null;
                          },
                          controller: dateController,
                          labelText: 'choose the  Date',
                          type: TextInputType.datetime,
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2023-12-12'))
                                .then((value) {
                              dateController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: iswasher,
                              onChanged: (bool? value) {
                                setState(() {
                                  iswasher = value!;
                                  extraService = 'washer';
                                });
                              },
                            ),
                            Container(
                              child: Image(
                                image: AssetImage('assets/images/washer.png'),
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isOil,
                              onChanged: (bool? value) {
                                setState(() {
                                  isOil = value!;
                                  extraService = 'Oil';
                                });
                                if (isOil) {
                                  setState(() {
                                    total = total! + 3.0;
                                  });
                                } else {
                                  setState(() {
                                    total = total! - 3.0;
                                  });
                                }
                              },
                            ),
                            Container(
                              child: Image(
                                image: AssetImage('assets/images/oil.jpg'),
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                        if (iswasher) washerList(context),
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
                                              Fuel_Quantity:
                                                  Quantitycontroller.text,
                                              total: total,
                                              time: timeController.text,
                                              date: dateday,
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
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              Text(
                                "$total",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ))
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

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Color(0xff939823);
  }

  String dropdownvalue = 'Basic';
  var items = [
    'Basic',
    'Deluxe',
    'Ultimate',
  ];

  Widget washerList(BuildContext context) => DropdownButton(
        value: dropdownvalue,
        icon: const Icon(Icons.keyboard_arrow_down),
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
          if (dropdownvalue == 'Basic') {
            total = total! + 2.0;
            print(total);
          }
          if (dropdownvalue == 'Deluxe') {
            total = widget.price! + 5.0;
            print(total);
          }
          if (dropdownvalue == 'Ultimate') {
            total = widget.price! + 8.0;
            print(total);
          }
        },
      );
}
