import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1nep/screens/home.dart';
import 'package:flutter_1nep/screens/loadingscreen.dart';
import 'package:flutter_1nep/screens/loginpage.dart';
import 'package:flutter_1nep/screens/otpscreen.dart';
import 'package:flutter_1nep/screens/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen()

    );
  }
}

