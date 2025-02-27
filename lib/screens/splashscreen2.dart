import 'package:flutter/material.dart';
import 'package:grocery_app/brand_colors.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double timervalue = 0.0;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controller.forward();
    controller.addListener(() {
      // print(controller.value);
      setState(() {
        timervalue = (controller.value);
      });
    });
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
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Hero(
                      tag: 'logo',
                      child: Image.asset('images/logo.png'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '1ne Place',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'bethellen',
                        color: BrandColors.colorGreen.withOpacity(timervalue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
