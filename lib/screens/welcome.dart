import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/screens/siginup.dart';
import 'package:fuel_ur_way_frontend/screens/signin.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';

class WelcomeScreen extends StatelessWidget {
  static const String path = '/';
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image(
                    image: AssetImage('assets/images/smalllogo.png'),
                    fit: BoxFit.contain,
                    height: 200,
                    width: 160,
                  ),
                  Image(
                    image: AssetImage('assets/images/name.png'),
                    fit: BoxFit.contain,
                    height: 260,
                    width: 260,
                  ),
                ],
              ),
              Text(
                'Start Your Jorney with Us ..',
                style: TextStyle(color: Colors.red),
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Text(
                    'ill up',
                    style: TextStyle(color: Colors.red),
                  ),
                  Image(
                    image: AssetImage('assets/images/counter.png'),
                    fit: BoxFit.fill,
                    height: 150,
                    width: 150,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image(
                    image: AssetImage('assets/images/firstpagespot.png'),
                    height: 66,
                    width: 66,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Container(
                        child: Text(
                      'Car wash',
                      style: TextStyle(fontSize: 22),
                    )),
                  ),
                ],
              ),
              Container(
                  child: Text(
                '&',
                style: TextStyle(fontSize: 22),
              )),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Image(
                    image: AssetImage('assets/images/firstpagedowunspot.png'),
                    height: 66,
                    width: 66,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 30, 30),
                    child: Container(
                        child: Text(
                      'Oil Change',
                      style: TextStyle(fontSize: 22),
                    )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(220, 0, 0, 0),
                child: Container(
                    child: Text(
                  'On Demand ! ',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                )),
              ),
              Container(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    "Sign Up",
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
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => SigninScreen()));
                  },
                  child: Text(
                    "Sign In",
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
        ),
      ),
    );
  }
}
