import 'dart:ui';
import 'package:flutter/material.dart';
import '../../application/services/method.dart';
import 'widgets/custom_textfiled.dart';

class ScreenSignUp extends StatefulWidget {
  final Function() onTap;
  ScreenSignUp({super.key, required this.onTap});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 7, 49, 124)),
            color: Colors.white,
            image: const DecorationImage(
                image: AssetImage('assets/images/signup_back_img.png'),
                fit: BoxFit.cover,
                opacity: 0.7)),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4,
                sigmaY: 4,
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.91,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 33, 76, 150)),
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "R E G I S T E R",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Enter your name',
                        obsecureText: false,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Enter your email',
                        obsecureText: false,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Enter your password',
                        obsecureText: true,
                      ),
                      const SizedBox(height: 20),
                      // CustomTextField(
                      //   controller: confirmPasswordController,
                      //   hintText: 'Re-enter your password',
                      //   obsecureText: true,
                      // ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 24, 57, 114),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Method.signUp(context,
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                          }
                        },
                        child: const Text('R E G I S T E R'),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account !',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                widget.onTap();
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
