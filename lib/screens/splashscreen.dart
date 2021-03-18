import 'dart:async';
import 'package:flutter/material.dart';
import 'splashscreen2.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 3),
      () {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => SplashScreen2()),
        // );
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => SplashScreen2(),
              transitionDuration: Duration(seconds: 2),
            )
            // MaterialPageRoute(
            //   builder: (context) => SplashScreen2(),
            // ),
            );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.png'), fit: BoxFit.cover),
            ),
            child: Center(
              child: Hero(
                tag: 'logo',
                child: Image.asset('images/logo.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
