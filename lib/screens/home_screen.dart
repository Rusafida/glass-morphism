import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glass_morphism/screens/login_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 231, 152, 245),
            Color.fromARGB(255, 32, 109, 243)
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        )),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.20),
                          Colors.white.withOpacity(0.10),
                        ])),
                    child: IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScreenLogin()));
                      },
                      icon: const Icon(Icons.logout, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
