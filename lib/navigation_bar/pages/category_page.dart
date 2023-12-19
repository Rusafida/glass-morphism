

import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text('Category',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}