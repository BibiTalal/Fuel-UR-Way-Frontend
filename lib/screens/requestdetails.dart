import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fuel_ur_way_frontend/providers/order_provider.dart';

class RequestDetails extends StatefulWidget {
  const RequestDetails({Key? key}) : super(key: key);

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
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
        body: Column(
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
        requestModel.loading
            ? Center(
                child: Container(
                  child: SpinKitThreeBounce(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                  ),
                ),
              )
            : Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('Car Type :'),
                          Text(
                            requestModel.order!.carType ?? '',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('User :'),
                          Text(
                            requestModel.order!.user ?? '',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('fuelType :'),
                          Text(
                            requestModel.order!.fuelType ?? '',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('litter :'),
                          Text(
                            requestModel.order!.litter ?? '',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('address :'),
                          Text(
                            requestModel.order!.address ?? '',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('address :'),
                          Text(
                            requestModel.order!.address ?? '',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('date :'),
                          Text(
                            '${requestModel.order!.date}' ?? '',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('address :'),
                          Text(
                            '${requestModel.order!.time}' ?? '',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('price :'),
                          Text(
                            '${requestModel.order!.price}' ?? '',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('status :'),
                          Text(
                            '${requestModel.order!.status}' ?? '',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
      ],
    ));
  }
}
