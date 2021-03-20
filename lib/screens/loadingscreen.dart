import 'package:flutter/material.dart';
import 'package:flutter_1nep/brand_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {




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
              child: SpinKitChasingDots(
                color: BrandColors.colorGreen2,
                size: 50.0,
              )

            ),
          ),
        ),
      ),
    );
  }
}
