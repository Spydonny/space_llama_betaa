import 'package:flutter/material.dart';

import '../../app.dart';
import '../../ui/widgets/auth/text_field_container.dart';
import '../../ui/widgets/default_alert.dart';
import 'auth_gate.dart';
import 'auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signup(BuildContext context) async {
    final auth = AuthService();

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await auth.signUpWithEmailPassword(
            emailController.text, passwordController.text, nameController.text);
      } catch (e) {
        String message = e.toString();
        showDialog(
            context: context,
            builder: (context) =>
                DefaultAlert(
                  label: 'Ошибка',
                  content: message,
                )
        );
        return;
      }
    } else {
      showDialog(
          context: context,
          builder: (context) =>
          const DefaultAlert(
              label: 'Passwords do not match',
              content: 'Please check the correctness\nof the password spelling'
          )
      );
      return;
    }
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const AuthGate(idx: 0)
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double scrnWidth = MediaQuery
        .sizeOf(context)
        .width;
    final double scrnHeight = MediaQuery
        .sizeOf(context)
        .height;

    return Scaffold(
      body: Center(
        child: Container(
          height: scrnHeight * 0.64,
          width: scrnWidth * 0.90,
          padding: EdgeInsets.symmetric(horizontal: scrnWidth * 0.08),
          decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(15.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.abc_sharp, color: theme.colorScheme.primary,
                  size: scrnHeight * 0.12),
              Text(
                'Sign up please',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              TextFieldContainer(
                controller: nameController,
                label: 'Username...',
                isPassword: false,),
              TextFieldContainer(
                controller: emailController,
                label: 'Email...',
                isPassword: false,),
              TextFieldContainer(
                  controller: passwordController,
                  label: 'Password...',
                  isPassword: true),
              TextFieldContainer(controller: confirmPasswordController,
                label: 'Repeat your password...', isPassword: true,),
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(
                        Size(scrnWidth * 0.45, scrnHeight * 0.08)),
                    maximumSize: WidgetStateProperty.all<Size>(
                        Size(scrnWidth * 0.55, scrnHeight * 0.08))
                ),
                onPressed: () => signup(context),
                child: Text('Sign up',
                    style: theme.textTheme.bodyLarge
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Are already have an account?  ',
                    style: theme.textTheme.labelSmall,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const AuthGate(idx: 0)
                            )
                        ),
                      child:
                      Text('Login',
                        style: TextStyle(
                            fontSize: theme.textTheme.bodyMedium?.fontSize,
                            color: theme.colorScheme.primary
                        ),
                      ),
                    ),
                ],
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    ),
                  child: Text('Continue without auth',
                    style: TextStyle(
                        fontSize: theme.textTheme.bodyMedium?.fontSize,
                        color: theme.colorScheme.primary
                    ),
                  ),
              ),
              const SizedBox(height: 2,)
            ],
          ),
        ),
      ),
    );
  }
}
