// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storytellerai/pages/home/home_page.dart';
import 'package:storytellerai/services/myUser.dart';
import 'auth/authentication_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<myUser?>(context);

    if (currentUser == null) {
      return Authenticate();
    } else {
      print(currentUser.uid);
      return Home_Page();
    }
  }
}
