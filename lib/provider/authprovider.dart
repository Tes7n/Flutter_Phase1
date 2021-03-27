import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_1nep/models/usermodel.dart';
import 'package:flutter_1nep/services/userservices.dart';

class AuthProvider {

  final FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId;
  UserServices _userServices = UserServices();


  //PhoneAuthentication

  Future phoneAuthentication(String phone) async {
    final PhoneVerificationCompleted verificationCompleted = (
        PhoneAuthCredential credential) async {
      await auth
          .signInWithCredential(credential);
    };

    final PhoneVerificationFailed verificationFailed = (
        FirebaseAuthException e) {
      print(e.code);
    };

    final PhoneCodeSent codeSent = (String verID, int resendToken) async {
      verificationId = verID;

      print('codesent!');
    };

    final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout = (
        String verificationID) {
      verificationId = verificationID;
    };


    try {
      auth.verifyPhoneNumber(phoneNumber: '+91${phone}',
          verificationCompleted: verificationCompleted,
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