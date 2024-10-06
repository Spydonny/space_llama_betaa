import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/auth_service.dart';
import '../choice_alert.dart';

class AccountContainer extends StatelessWidget {
  const AccountContainer({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scrnWidth = MediaQuery
        .sizeOf(context)
        .width;
    final scrnHeight = MediaQuery
        .sizeOf(context)
        .height;
    final authService = FirebaseAuth.instance;
    const borderRadius = 25.0;

    return Center(
        child: Container(
            width: scrnWidth * 0.90,
            height: scrnHeight * 0.14,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(borderRadius),
                color: theme.colorScheme.onPrimaryContainer
            ),
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: scrnWidth * 0.05),
                        child: const Icon(Icons.account_circle_sharp,
                          size: 70,
                        )
                    ),
                    SizedBox(
                      height: scrnHeight * 0.20,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const SizedBox(height: 1),
                            Text(username),
                            Text('${authService.currentUser!.email}',
                              style: theme.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 1),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scrnHeight * 0.20,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const SizedBox(height: 1),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: scrnWidth * 0.05),
                                child: IconButton(
                                    onPressed: () =>
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                ChoiceAlert(
                                                  label: 'Вы точно хотите\nвыйти из аккаунта',
                                                  content: 'Вам придется заходить в\nприложение заново',
                                                  onPressed: () async {
                                                    await AuthService()
                                                        .signOut();
                                                  },
                                                )
                                        ),
                                    icon: const Icon(Icons.exit_to_app_sharp)
                                )
                            ),
                            const SizedBox(height: 1),
                          ],
                        ),
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}
