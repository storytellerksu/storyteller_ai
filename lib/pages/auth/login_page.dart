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
  String username = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          child: Form(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(

              
                child: Image.asset("assets/app_logo.webp",
                height: 120,
                width: 120,
                fit: BoxFit.cover
                ),
                ),
                SizedBox(height: 30),

            
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

                SizedBox(height: 20),
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

                SizedBox(height: 20),

                if(error.isNotEmpty) 
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),

                  ),
                
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
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
                            error = "Incorrect Password";
                          });
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Wrapper()),
                            
                          );
                        }
                      }
            
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 16),
                  ),
                  ),
                ),



                    
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      dynamic result = await auth.guestSignIn();
                      if(result!= null) {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => Wrapper()),
                        );
                    } else {
                      setState(() {
                        error = "Guest login unavaiable";
                      });
                    }

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),
                    child: Text(
                      "Guest Sign In",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                  

                SizedBox(height: 20),
                Text("Don't Have an Account?", 
                style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registration(),
                        ),
                      );
                    },
                    child: Text("Sign-Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    
                    )
                    ),
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }
}