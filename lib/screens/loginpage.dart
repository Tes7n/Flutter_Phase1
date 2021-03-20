import 'package:flutter/material.dart';
import 'package:flutter_1nep/brand_colors.dart';
import 'package:flutter_1nep/screens/otpscreen.dart';

// import 'package:firebase_database/firebase_database.dart';



class LoginPage extends StatelessWidget {
  TextEditingController _controller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    Hero(
                      tag: 'logo',
                      child: Image(
                        image: AssetImage('images/logo.png'),
                        alignment: Alignment.center,
                        height: 175,
                        width: 175,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        // controller: emailConroller,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: BrandColors.colorMblue, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: BrandColors.colorMblue, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          labelText: '+91',
                          labelStyle: TextStyle(
                              fontSize: 18.0, color: BrandColors.colorMblue),
                          // prefixText: '+91',
                          // prefixStyle: TextStyle(
                          //     fontSize: 18, color: BrandColors.colorMyellow),
                        ),
                        maxLength: 10,
                        style: TextStyle(
                            fontSize: 18.0, color: BrandColors.colorMblue),
                        controller: _controller,
                      ),
                    ),
                    TextButton(
                      onPressed: () {

                        // DatabaseReference dbRef = FirebaseDatabase.instance.reference().child('Test');
                        // dbRef.set('IsConnected');


                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => OtpScreen(_controller.text),
                              transitionDuration: Duration(seconds: 1),
                            ),
                            );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        child: Text(
                          'Send OTP',
                          style: TextStyle(color: BrandColors.colorGreen),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.black.withOpacity(.2),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: BrandColors.colorGreen2),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 30,
                      thickness: .3,
                      color: BrandColors.colorGreen,
                      indent: 80,
                      endIndent: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 0.0),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/google2.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                  fontSize: 16, color: BrandColors.colorMblue),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
