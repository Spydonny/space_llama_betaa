import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'account_container.dart';
import 'ask_to_auth_container.dart';

class AuthStreamChecker extends StatelessWidget {
  const AuthStreamChecker({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.hasData ?  AccountContainer(username: username,) : const AskToAuthContainer();
        }
    );
  }
}
