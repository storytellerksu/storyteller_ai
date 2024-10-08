// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:storytellerai/services/myUser.dart';
import 'firebase_options.dart';
import 'pages/wrapper.dart';
import 'package:storytellerai/services/user_services.dart';

void main() async {
  // waits for widgets to load
  WidgetsFlutterBinding.ensureInitialized();
  // initializes firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamProvider<myUser?>.value(
        value: UserServices().user,
        catchError: (_, __) {
          return null;
        },
        initialData: null,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      ),
    );
  }
}
