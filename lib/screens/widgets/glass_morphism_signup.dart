// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glass_morphism/firebase_implementation/firebase_auth_services.dart';
import 'package:glass_morphism/screens/home_screen.dart';

class GlassMorphismSignup extends StatefulWidget {
  const GlassMorphismSignup({super.key});

  @override
  State<GlassMorphismSignup> createState() => _GlassMorphismSignupState();
}

class _GlassMorphismSignupState extends State<GlassMorphismSignup> {

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose (){
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.20),
            Colors.white.withOpacity(0.10)
          ],
        ),
      ),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 20),
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.person,
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
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
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
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 20),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    suffixIcon:
                        const Icon(Icons.visibility_off, color: Colors.white)),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: signUp,
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
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
  void signUp() async{
  String username = _usernameController.text;
  String email = _emailController.text;
  String password = _passwordController.text;

  // ignore: non_constant_identifier_names
  User? user =await _auth.signUpWithEmailAndPassword(email, password);

  if (user!= null) {
    print('User created successfully');
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ScreenHome()));
  } else {
    print('some error occurred');
  }

}
}

