import 'package:astro_llama/features/auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import 'login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key, required this.idx});
  final int idx;

  @override
  Widget build(BuildContext context) {
    List<Widget> authScreens = [const LoginScreen(), const SignupScreen()];
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return snapshot.hasData ? const MainPage(): authScreens[idx];
      },
    );
  }
}
