// import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_1nep/provider/authprovider.dart';
import 'package:flutter_1nep/screens/loadingscreen.dart';
import 'package:flutter_1nep/services/userservices.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../brand_colors.dart';
import 'home.dart';
import 'loginpage.dart';

class OtpScreen extends StatefulWidget {
  final String phone;

  OtpScreen(this.phone);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final AuthProvider _auth = AuthProvider();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  // UserServices _userServices = UserServices();
  // String _verificationCode;

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
            child: Scaffold(
              key: _scaffoldkey,
              resizeToAvoidBottomInset: false,
              body: Center(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bg.png'), fit: BoxFit.cover),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Center(
                            child: Hero(
                              tag: 'logo',
                              child: Image(
                                image: AssetImage('images/logo.png'),
                                alignment: Alignment.center,
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            ' OTP  send to ${widget.phone}',
                            style: TextStyle(
                                fontSize: 18,
                                color: BrandColors.colorTextSemiLight),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: PinPut(
                              fieldsCount: 6,
                              textStyle: const TextStyle(
                                  fontSize: 25.0, color: Colors.white),
                              eachFieldWidth: 40.0,
                              eachFieldHeight: 55.0,
                              focusNode: _pinPutFocusNode,
                              controller: _pinPutController,
                              submittedFieldDecoration: pinPutDecoration,
                              selectedFieldDecoration: pinPutDecoration,
                              followingFieldDecoration: pinPutDecoration,
                              pinAnimationType: PinAnimationType.fade,
                              onSubmit: (pin) async {
                                try {
                                  PhoneAuthCredential phoneAuthCredential =
                                      PhoneAuthProvider.credential(
                                          verificationId: _auth.verificationId,
                                          smsCode: pin);

                                   final User user = (await _auth.auth.signInWithCredential(phoneAuthCredential)).user;
                                  //loading
                                  LoadingScreen.showLoadingDialog(context, _scaffoldkey);
                                   //create user data in firestore after registration
                                  _auth.createUser(user.uid,user.phoneNumber);
                                  //navigation
                                  if (user != null) {

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => Home()),
                                            (route) => false);

                                }} catch (e) {

                                  FocusScope.of(context).unfocus();
                                  _scaffoldkey.currentState.showSnackBar(
                                      SnackBar(content: Text('invalid OTP')));
                                }
                              }
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 220,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 2.0),
                                  child: Text(
                                    'Resend OTP',
                                    style: TextStyle(
                                        color: BrandColors.colorGreen),
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.black.withOpacity(.2),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: BrandColors.colorGreen2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: .5,
                            color: BrandColors.colorGreen,
                            indent: 60,
                            endIndent: 60,
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 0.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => LoginPage(),
                                    transitionDuration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.black.withOpacity(.2),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: BrandColors.colorGreen2),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Change Number',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: BrandColors.colorMblue,
                                    ),
                                  ),
                                ],
                              ),
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



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _verifyPhone();
    _auth.phoneAuthentication(widget.phone);
  }
}
