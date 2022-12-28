import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';
import 'package:fuel_ur_way_frontend/providers/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:fuel_ur_way_frontend/screens/siginup.dart';
import 'package:provider/provider.dart';
import 'package:fuel_ur_way_frontend/screens/mainscreen.dart';

class SigninScreen extends StatefulWidget {
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String? username;
  String? password;

  bool loading = false;
  var formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: Image(
                        image: AssetImage('assets/images/smalllogo.png'),
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 10, 0),
                      child: Image(
                        image: AssetImage('assets/images/name.png'),
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  'Sign IN',
                  style: TextStyle(fontSize: 22, color: Color(0xff939823)),
                ),
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/images/logologin.png'),
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  children: [
                    Icon(Icons.person),
                    Container(
                        width: 240,
                        child: TextFormField(
                          controller: usernameController,
                          autofocus: false,
                          onChanged: (input) {
                            setState(() {
                              username = input;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Should not be Empty ';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 13),
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    Container(
                        width: 240,
                        child: TextFormField(
                          controller: passwordController,
                          onChanged: (input) {
                            setState(() {
                              password = input;
                            });
                          },
                          autofocus: false,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter something';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 13),
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: 'password',
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await context
                          .read<AuthProvider>()
                          .loginData(
                              username: usernameController.text,
                              password: passwordController.text)
                          .then((value) {
                        context.pop();
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => MainScreen(
                                      username: usernameController.text,
                                    )));
                      }).catchError((e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("login unsuccessful"),
                          ),
                        );
                        print(e.toString());
                      });
                    } else {
                      print("not ok");
                    }
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    Text(
                      'you Don\'t have  an account',
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Container(
                            child: Text('Register',
                                style: TextStyle(color: Colors.blue)))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text('Check your email or password'),
            actions: <Widget>[
              new TextButton(
                child: new Text(
                  'Close',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
