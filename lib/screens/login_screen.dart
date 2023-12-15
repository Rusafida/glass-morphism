import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glass_morphism/screens/signUp_screen.dart';

import 'widgets/glass_morphism_signin.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: const GlassMorphismSIgnin(),
                  ),
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
                              builder: (context) => const ScreenSignUp()));
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
                            'Don\'t Have Account, CLICK HERE',
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
