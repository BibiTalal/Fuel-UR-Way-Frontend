import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';

class MapScreen extends StatefulWidget {
  String? fueltype;
  String? carname;
  String? Fuel_Quantity;
  String? address;
  String? Block;
  String? Street;
  String? Buildingn;
  bool? PaymentType = false;

  MapScreen(
      {this.fueltype,
      this.carname,
      this.Fuel_Quantity,
      this.address,
      this.Block,
      this.Street,
      this.Buildingn,
      this.PaymentType});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
              // GoogleMap(initialCameraPosition:initialPosition ,
              //   mapType: MapType.normal,
              //   onMapCreated:(GoogleMapController controller){
              //     _controller.complete(controller);
              //
              //   } ,
              // ),

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
                          'Add additional information',
                          style: TextStyle(
                              color: drawerBackgroundColor, fontSize: 22),
                        ),
                        Text('Address'),
                        Addresslist(context),
                        Row(
                          children: [
                            Container(
                                width: 120,
                                child: TextFormField(
                                  controller: null,
                                  onChanged: (value) {
                                    widget.Block = value;
                                  },
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 13),
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    hintText: '   Block',
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
                                  controller: null,
                                  onChanged: (value) {
                                    widget.Street = value;
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
                              controller: null,
                              onChanged: (value) {
                                widget.Buildingn = value;
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
                        //
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

  String dropdownvalue = 'Address';
  var items = [
    'Hawally',
    'Al Jahra',
    'Al Ahmaddi',
    'Asima',
    'Farwaniya',
  ];
  Widget Addresslist(BuildContext context) => DropdownButton(
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
