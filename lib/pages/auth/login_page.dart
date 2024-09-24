// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:storytellerai/pages/auth/registration.dart';
import 'package:storytellerai/pages/wrapper.dart';
import 'package:storytellerai/services/user_services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final UserServices auth = UserServices();
  final globalKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
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
                Image.asset("assets/logo_example.webp",
                height: 100,
                ),
                SizedBox(height: 30,),
                Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 24, 
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.bold,
          
                  ),
                ),
          
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
                
                TextFormField(
                   decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
          
                      ),
                    ),
                  
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Enter a Password Longer than 6 Characters";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),

                if(error.isNotEmpty) 
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),

                  ),
                
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () async {
                      if (globalKey.currentState!.validate()) {
                        dynamic result = await auth.emailLogin(email, password);
                        print(result);
                        if (result == null) {
                          setState(() {
                            error = "Error Logging In";
                          });
                        } else if (result == 1) {
                          setState(() {
                            error = "Wrong Password";
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
                    child: Text("Sign In")),
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
                ElevatedButton(
                  onPressed: () async {
                    dynamic result = await auth.guestSignIn();
                    if (result == null) {
                      print("Error Logging In");
                    } else {
                      print("Logging In");
                      print(result.uid);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Wrapper(),
                        ),
                      );
                    }
                  },
                  child: Text("Sign-in as Guest"),
                ),
                SizedBox(height: 10),
                Text("Don't Have an Account?"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registration(),
                        ),
                      );
                    },
                    child: Text("Sign-Up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
