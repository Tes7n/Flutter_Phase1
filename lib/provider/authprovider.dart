

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1nep/models/usermodel.dart';
import 'package:flutter_1nep/screens/start/home/startscreen.dart';
import 'package:flutter_1nep/services/userservices.dart';
import 'package:flutter_1nep/screens/customwidgets/loadingscreen.dart';

class AuthProvider {

  final FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId;
  UserServices _userServices = UserServices();


  //PhoneAuthentication

  Future phoneAuthentication(BuildContext context, String phone,GlobalKey<ScaffoldState> scaffoldkey) async {

//auto verify ot when sim in same phone
    final PhoneVerificationCompleted verified=
        (AuthCredential authResult){
          LoadingScreen.showLoadingDialog(context,scaffoldkey);
          Timer(
            Duration(seconds: 3),
                () {

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => StartScreen()),
                          (route) => false);
            },
          );

    };

    final PhoneVerificationFailed verificationFailed = (
        FirebaseAuthException e) {
      print(e.code);
      FocusScope.of(context).unfocus();
      SnackBar(content: Text('invalid OTP'));
    };

    final PhoneCodeSent codeSent = (String verID, int resendToken) async {
      this.verificationId = verID;
      print('codesent!');
    };

    final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout = (
        String verificationID) {
      this.verificationId = verificationID;
    };


    try {
      await auth.verifyPhoneNumber(phoneNumber: '+91${phone}',
          verificationCompleted: verified,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
          timeout: Duration(seconds: 120));
    }
    catch (e) {
      print(e);
    }
  }



//method for creating user in firestore
  void createUser(String id, String phone) {
    _userServices.createUserData({
      'id': id,
      'phone': phone
    });
  }



}