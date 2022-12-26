import 'package:flutter/material.dart';

import 'package:fuel_ur_way_frontend/providers/order_provider.dart';

import 'package:provider/provider.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:toast/toast.dart';

class PaymentScreen extends StatefulWidget {
  String? fueltype;

  String? Username;

  String? carname;

  String? Fuel_Quantity;

  int? Amount;

  var Payment;

  PaymentScreen(
      {this.fueltype, this.carname, this.Fuel_Quantity, this.Payment});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();

    final request = Provider.of<OrderProvider>(context, listen: false);

    request.getorderData();
  }

  @override
  Widget build(BuildContext context) {
    final requestModel = Provider.of<OrderProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
              child: Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.blue),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/images/card.png'),
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black,
                      height: 20,
                    ),
                    Text('Request Information'),
                    Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black,
                      height: 20,
                    ),
                    Text('User Name:'),
                    Text('User Name: ${widget.Username}'),
                    Text('Car Type: ${widget.carname}'),
                    Text('Fuel Type: ${widget.fueltype}'),
                    Text('Quantity: ${widget.Fuel_Quantity}'),
                    Text('Amount: ${widget.Fuel_Quantity}'),
                    Text('Payment Information'),
                    Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black,
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            requestModel.postData(
                                user: widget.Username!,
                                carType: widget.carname!,
                                fuelType: widget.fueltype!,
                                litter: widget.Fuel_Quantity!,
                                address: 'null',
                                date: 'null',
                                time: 'null',
                                price: 'null',
                                payed: 'null',
                                status: 'null');

                            // Navigator.push(

                            //    context,

                            //    new MaterialPageRoute(builder: (context) =>

                            //        EndScreen(

                            //            Payment: widget.Payment

                            //        ))) ;
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
          ],
        ),
      ),
    );
  }
}
