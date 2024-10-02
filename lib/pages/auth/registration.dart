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
                Image.asset("assets/placehold.jpeg",
                height: 100,
                ),
            
                SizedBox(height: 30),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20, fontFamily: 'San Francisco',
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefix: Icon(Icons.email),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
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
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
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
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )

                  ),
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
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirmed Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
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
                SizedBox(height: 20),
                
                //Handle errors
                if(error.isEmpty)
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
                        print(email);
                        dynamic result = await auth.emailRegistration(
                            email, password, username);
                        if (result == null) {
                          setState(() {
                            error = "Error Registering";
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

                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                      ),
                    

                child: Text("Create Account",
                style: TextStyle(fontSize: 16),
                )
                ),
                ),
                
                SizedBox(height: 20),
                Text("Already Have an Account?",
                style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },

                    child: Text("Log In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    )),
              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}
