import 'package:flutter/material.dart';
import 'package:flutter_1nep/brand_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              key: key,
              backgroundColor: Colors.transparent,
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      SpinKitChasingDots(
                        color: BrandColors.colorGreen2,
                        size: 50.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
