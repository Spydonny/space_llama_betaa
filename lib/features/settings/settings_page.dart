import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../ui/widgets/settings_widgets/auth_stream_checker.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDark = false;
  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  String username = '';

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  Future<void> fetchUserData() async {
    var currentUser = firebaseAuth.currentUser;
    if (currentUser != null) {
      try {
        // Fetch user data from Firestore based on the UID
        DocumentSnapshot userData = await firestore
            .collection('users')
            .doc(currentUser.uid)
            .get();

        setState(() {
          username = userData['username'] ?? 'Guest';
        });
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    // final isDark = context
    //     .read<ThemeCubit>()
    //     .state
    //     .isDark;
    final screenHeight = MediaQuery
        .sizeOf(context)
        .height;
    final screenWidth = MediaQuery
        .sizeOf(context)
        .width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 20,),
        // Center(
        //     child:SwitchContainer(
        //         height: screenHeight,
        //         width: screenWidth,
        //         value: isDark,
        //         title: 'Темная тема',
        //         onChanged: (value) {
        //           isDark = value;
        //         }
        //     )
        // )
        AuthStreamChecker(username: username,)
      ],
    );
  }
}
