import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: IconButton(
            onPressed: () {
               FirebaseAuth.instance.signOut();
            },
            icon: const Icon(
              Icons.logout,
            )),
      ),
    );
  }
}
