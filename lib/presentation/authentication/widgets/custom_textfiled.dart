import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final bool obsecureText;
  const CustomTextField({super.key, required this.hintText, required this.controller, required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color.fromARGB(255, 24, 62, 93),
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.white.withOpacity(0.7),
        ),
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 12, 49, 123), width: 1.0)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.7)),
      ),
    );
  }
}
