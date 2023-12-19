import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glass_morphism/firebase_options.dart';
import 'package:glass_morphism/grid_details/grid_items_home.dart';
import 'package:glass_morphism/presentation/authentication/signIn.dart';
import 'package:glass_morphism/presentation/authentication/signUp.dart';
import 'presentation/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCF2Mj9G_nOI8WN7jl2pWPdyO_25ouIknc',
      appId: '1:338272397563:android:0b91d09714c2671570685e',
      messagingSenderId: '338272397563',
      projectId: 'glass-morphism-a1c02',
      storageBucket: 'glass-morphism-a1c02.appspot.com',
    ),
   // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const ScreenSplash(),
  ));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: auth.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error detected'));
            } else if (snapshot.hasData) {
              return const GridHome();
            } else {
              return const AuthPage();
            }
          }),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? ScreenSignIn(onTap: toggle)
        : ScreenSignUp(
            onTap: toggle,
          );
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
