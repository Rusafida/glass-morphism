import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glass_morphism/screens/home_screen.dart';
import 'screens/widgets/glass_morphism_signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyCF2Mj9G_nOI8WN7jl2pWPdyO_25ouIknc',
    appId: '1:338272397563:android:0b91d09714c2671570685e',
    messagingSenderId: '338272397563',
    projectId: 'glass-morphism-a1c02',
    storageBucket: 'glass-morphism-a1c02.appspot.com',
  ));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}
class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context ,snapshot){
          if (snapshot.hasData) {
            return const ScreenHome();
          } else {
            return const GlassMorphismSIgnin();
          }
        },
      ),
    );
  }
}
