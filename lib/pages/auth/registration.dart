// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:storytellerai/pages/auth/login_page.dart';
import 'package:storytellerai/pages/wrapper.dart';
import 'package:storytellerai/services/user_services.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final UserServices auth = UserServices();
  final globalKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String username = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                Image.asset("assets/placehold.jpeg"),
                Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20, fontFamily: 'San Francisco'
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter An Email";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter An Username";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    username = value;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password Minimum 6 Characters";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "Please Confirm Your Password";
                    } else if (value != password) {
                      return "Passwords Do Not Match";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () async {
                      if (globalKey.currentState!.validate()) {
                        print(email);
                        dynamic result = await auth.emailRegistration(
                            email, password, username);
                        if (result == null) {
                          setState(() {
                            error = "ERROR";
                          });
                        } else if (result == 1) {
                          setState(() {
                            error = "Email Already in Use";
                          });
                        } else if (result == 2) {
                          setState(() {
                            error = "Invalid Email Format";
                          });
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Wrapper(),
                            ),
                          );
                        }
                      }
                    },
                    child: Text("Create Account")),
                SizedBox(height: 10),
                if (error.isNotEmpty)
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(height: 10),
                Text("Already Have an Account?"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text("Log In")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
