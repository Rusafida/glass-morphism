// ignore_for_file: use_build_context_synchronously

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../firebase_implementation/firebase_auth_services.dart';


class GlassMorphismSIgnin extends StatefulWidget {
  const GlassMorphismSIgnin({super.key});

  @override
  State<GlassMorphismSIgnin> createState() => _GlassMorphismSIgninState();
}

class _GlassMorphismSIgninState extends State<GlassMorphismSIgnin> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.60,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                Colors.white.withOpacity(0.20),
                Colors.white.withOpacity(0.10)
              ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const Spacer(),
                // const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 20),
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 20),
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: const Icon(Icons.visibility_off,
                            color: Colors.white)),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: signIn,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

//    void signIn() async{
//   String email = _emailController.text;
//   String password = _passwordController.text;

//   // ignore: non_constant_identifier_names
//   User? user =await _auth.signInWithEmailAndPassword(email, password);

//   if (user!= null) {
//     print('User successfully signin');
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>const ScreenHome()));
//   } else {
//     print('some error occurred');
//   }

// }
}
