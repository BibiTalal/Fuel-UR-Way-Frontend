import 'package:flutter/material.dart';

import 'package:fuel_ur_way_frontend/style/colors.dart';

import 'package:fuel_ur_way_frontend/screens/mainscreen.dart';

class LastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Text(
            'Thank you we received your  order... we will be with you shortly',
            style: TextStyle(fontSize: 30, color: drawerBackgroundColor),
          ),
          Container(
            width: 250,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pushNamed('/mainscreen');
              },
              child: Text(
                "Done",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(buttonColor),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
