import 'package:flutter/material.dart';
import 'package:flutter_1nep/screens/loginpage.dart';
import 'package:flutter_1nep/screens/otpscreen.dart';
import 'package:flutter_1nep/screens/splashscreen.dart';

void main()  {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage()

    );
  }
}

