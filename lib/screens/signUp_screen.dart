// ignore_for_file: file_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glass_morphism/screens/login_screen.dart';
import 'widgets/glass_morphism_signup.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  // const Spacer(),
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
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScreenLogin()));
                        },
                        icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
                      ),
                    ),                   
                  ),
                 const SizedBox(height: 20),
                  const Spacer(),
                  const GlassMorphismSignup(),
                  const Spacer(),
                   ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: InkWell(
                        onTap: (){
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScreenLogin()));
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Colors.white.withOpacity(0.20),
                                Colors.white.withOpacity(0.10)
                              ])),
                          child: const Center(
                              child: Text(
                            'Already have an Account,LOGIN',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
