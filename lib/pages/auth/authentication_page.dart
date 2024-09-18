import 'package:flutter/material.dart';
import 'package:storytellerai/pages/auth/authorization_menu.dart';
import 'package:storytellerai/pages/auth/login_page.dart';
import 'package:storytellerai/pages/auth/registration.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AuthorizationMenu(),
    );
  }
}
