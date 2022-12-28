import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';
import 'package:fuel_ur_way_frontend/screens/mainscreen.dart';
import 'package:provider/provider.dart';
import 'package:fuel_ur_way_frontend/providers/auth.dart';
import 'package:fuel_ur_way_frontend/screens/signin.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  String? username;

  @override
  Widget build(BuildContext context) {
    final register_provider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
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
              Text(
                'Sign Up Form',
                style: TextStyle(fontSize: 22, color: Color(0xff939823)),
              ),
              Stack(alignment: Alignment.bottomRight, children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.black,
                    )),
              ]),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 158,
                      child: Row(
                        children: [
                          Icon(Icons.person, size: 16),
                          Container(
                              width: 140,
                              child: TextFormField(
                                autofocus: false,
                                controller: usernameController,
                                onChanged: (value) {
                                  usernameController.text = value;
                                },
                                onFieldSubmitted: (value) {
                                  usernameController.text = value;
                                  username = usernameController.text;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Should not be Empty';
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 13),
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  hintText: '   UserName',
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
                      width: 5,
                    ),
                    SizedBox(
                      height: 50,
                      width: 140,
                      child: Row(
                        children: [
                          Icon(Icons.email, size: 13),
                          Container(
                              width: 120,
                              child: TextFormField(
                                controller: phoneController,
                                autofocus: false,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'The field must not be empty';
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 13),
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  hintText: '   Email',
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
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    Container(
                        width: 240,
                        child: TextFormField(
                          controller: passwordController,
                          onChanged: (value) {
                            // user.password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          autofocus: false,
                          obscureText: true,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    Container(
                        width: 240,
                        child: TextFormField(
                          controller: confirmPasswordController,
                          onChanged: (value) {
                            // user.password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          autofocus: false,
                          obscureText: true,
                          style: TextStyle(fontSize: 13),
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
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
                      await register_provider.UserRegister(
                              email: phoneController.text,
                              username: usernameController.text,
                              password: passwordController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => MainScreen(
                                      username: usernameController.text,
                                    )));
                      }).catchError((e) {
                        print(e.toString());
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Registration FAILD"),
                          ),
                        );
                      });
                    } else {
                      print("not ok");
                    }
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    Text(
                      'already have  an account',
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      SigninScreen())); // for testing
                        },
                        child: Container(
                            child: Text('Login',
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
}
