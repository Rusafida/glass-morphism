
import 'package:flutter/material.dart';
import '../../application/services/method.dart';
import 'widgets/custom_textfiled.dart';

class ScreenSignIn extends StatefulWidget {
   final Function() onTap;
   ScreenSignIn({super.key, required this.onTap});

  @override
  State<ScreenSignIn> createState() => _ScreenSignInState();
}

class _ScreenSignInState extends State<ScreenSignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/images/log_back_image.png'),
                fit: BoxFit.cover,
                opacity: 0.7),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.91,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 22, 60, 125)),
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "L O G I N",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 25, 54, 114),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          Method.signIn(context,
                              email: emailController.text.trim(),
                              password: passwordController.text.trim());
                        }
                      },
                      child: const Text('L O G I N'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'New user ?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        TextButton(
                        //  onPressed: onClickedSignUp,
                        onPressed: (){
                         widget.onTap();
                        },
                          child: const Text('SignUp'),
                        ),
                        //  
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
