import 'package:flutter/material.dart';

import '../../../features/auth/auth_gate.dart';

class AskToAuthContainer extends StatelessWidget {
  const AskToAuthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scrnWidth = MediaQuery
        .sizeOf(context)
        .width;
    final scrnHeight = MediaQuery
        .sizeOf(context)
        .height;
    const borderRadius = 25.0;

    return Center(
        child: Container(
            width: scrnWidth * 0.85,
            height: scrnHeight * 0.10,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(borderRadius),
                color: theme.colorScheme.onPrimaryContainer
            ),
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(width: 4),
                    TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const AuthGate(idx: 0)
                                )
                            ),
                        child: const Text('Login')
                    ),
                    TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const AuthGate(idx: 1)
                                )
                            ),
                        child: const Text('Sign Up')
                    ),
                    const SizedBox(width: 4),
                  ],
                )
            )
        )
    );
  }
}
