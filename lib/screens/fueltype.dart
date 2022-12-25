import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/screens/request.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';

class FuelTypeScreen extends StatefulWidget {
  @override
  State<FuelTypeScreen> createState() => _FuelTypeScreenState();
}

class _FuelTypeScreenState extends State<FuelTypeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  String? fueltype;
  gridView(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data.map((photo) {
          return GestureDetector(
              child: GridTile(
                child: Text(''),
              ),
              onTap: () {
                openrequest(context, photo);
              });
        }).toList(),
      ),
    );
  }

  openrequest(BuildContext context, photo) {
    scaffoldKey.currentState!.showBottomSheet(
      (context) => Container(
        width: 500,
        color: Colors.grey[300],
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Fuel Type IN',
                style: TextStyle(fontSize: 22, color: Color(0xff939823)),
              ),
              Divider(color: Colors.white70, height: 5.0),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              RequestScreen(fueltype: 'Fuel Type IN')));
                },
                child: Container(
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
                          child: Text(
                            "Premium91",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                            child: Text("0.085 fils/litter",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ))),
                      ],
                    )),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              RequestScreen(fueltype: 'Super')));
                },
                child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber),
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
                          child: Text(
                            "Super",
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                            child: Text("0.105 fils/litter",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 15,
                                ))),
                      ],
                    )),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              RequestScreen(fueltype: 'Ultra 98')));
                },
                child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
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
                          child: Text(
                            "Ultra 98",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                            child: Text("0.235 fils/litter",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                ))),
                      ],
                    )),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              RequestScreen(fueltype: 'Disesel/Kerosene')));
                },
                child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
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
                          child: Text(
                            "Disesel/Kerosene",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                            child: Text("0.115 fils/litter",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                ))),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      elevation: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/cars/Micro.png",
      "assets/images/cars/Sedan.png",
      "assets/images/cars/CUV.png",
      "assets/images/cars/SUV.png",
      "assets/images/cars/HatchBack.png",
      "assets/images/cars/Micro.png",
      "assets/images/cars/Micro.png",
      "assets/images/cars/Micro.png",
      "assets/images/cars/Micro.png",
      "assets/images/cars/Micro.png",
      "assets/images/cars/Micro.png",
      "assets/images/cars/Micro.png",
    ];
    List<String> name = [
      'Micro',
      'Sedan',
      'CUV',
      'SUV',
      'HatchBack',
      'Roadster',
      'PickUp',
      'Van',
      'Coupe',
      'SuperCar',
      'CamperVan',
      'Mini Track'
    ];
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.black45,
          size: 20,
        ),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              "Car Type :",
              style: TextStyle(color: drawerBackgroundColor, fontSize: 22),
            ),
          ),

          // Flexible(
          //     child:FutureBuilder<List<photo>>(
          //       future: DioHelper.fetchPhoto(),
          //       builder:(context,snapshot){
          //         if(snapshot.hasError){
          //           return Text('no Car to veiw ${snapshot.error}');
          //
          //         }else if(snapshot.hasData){
          //           return gridView(snapshot);
          //         }
          //         return Center(child: CircularProgressIndicator());
          //       } ,
          //     )
          // ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: GridView.builder(
                itemCount: images.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 22.0,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState!.showBottomSheet(
                            (context) => Container(
                              width: 500,
                              color: Colors.grey[300],
                              padding: EdgeInsets.all(20),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Fuel Type IN',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xff939823)),
                                    ),
                                    Divider(color: Colors.white70, height: 5.0),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    RequestScreen(
                                                        fueltype:
                                                            'Fuel Type IN',
                                                        carname: name[index])));
                                      },
                                      child: Container(
                                          width: 300,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.red),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0),
                                              bottomRight:
                                                  Radius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 0, 0),
                                                child: Text(
                                                  "Premium91",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Center(
                                                  child:
                                                      Text("0.085 fils/litter",
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 15,
                                                          ))),
                                            ],
                                          )),
                                    ),
                                    SizedBox(height: 15),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    RequestScreen(
                                                        fueltype: 'Super',
                                                        carname: name[index])));
                                      },
                                      child: Container(
                                          width: 300,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.amber),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0),
                                              bottomRight:
                                                  Radius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 0, 0),
                                                child: Text(
                                                  "Super",
                                                  style: TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Center(
                                                  child:
                                                      Text("0.105 fils/litter",
                                                          style: TextStyle(
                                                            color: Colors.amber,
                                                            fontSize: 15,
                                                          ))),
                                            ],
                                          )),
                                    ),
                                    SizedBox(height: 15),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    RequestScreen(
                                                        fueltype: 'Ultra 98',
                                                        carname: name[index])));
                                      },
                                      child: Container(
                                          width: 300,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.green),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0),
                                              bottomRight:
                                                  Radius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 0, 0),
                                                child: Text(
                                                  "Ultra 98",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Center(
                                                  child:
                                                      Text("0.235 fils/litter",
                                                          style: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 15,
                                                          ))),
                                            ],
                                          )),
                                    ),
                                    SizedBox(height: 15),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    RequestScreen(
                                                        fueltype:
                                                            'Disesel/Kerosene',
                                                        carname: name[index])));
                                      },
                                      child: Container(
                                          width: 300,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.blue),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0),
                                              bottomRight:
                                                  Radius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 0, 0),
                                                child: Text(
                                                  "Disesel/Kerosene",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Center(
                                                  child:
                                                      Text("0.115 fils/litter",
                                                          style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 15,
                                                          ))),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            elevation: 20,
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: Image(
                            image: AssetImage(images[index]),
                          ),
                        ),
                      ),
                      Text(name[index])
                    ],
                  );
                },
              )),
        ],
      ),
    );
  }
}
