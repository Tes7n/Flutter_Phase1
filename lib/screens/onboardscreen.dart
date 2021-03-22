import 'package:flutter/material.dart';
import 'package:flutter_1nep/provider/locationprovider.dart';
import 'package:flutter_1nep/screens/loadingscreen.dart';
import 'package:flutter_1nep/screens/loginpage.dart';
import 'package:flutter_1nep/screens/mapscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../brand_colors.dart';
import 'onboard.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context, listen: false);

    return Scaffold(
            key: _scaffoldkey,
            body: SafeArea(
              child: Center(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bg.png'), fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Positioned(
                              top: 10.0,
                              right: 20.0,
                              child: TextButton(
                                child: Text(
                                  'SKIP',
                                  style:
                                      TextStyle(color: BrandColors.colorGreen),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: Onboard(),
                            ),
                            Text(
                              'Ready to book your first Service?',
                              style: TextStyle(color: BrandColors.colorMPeach),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextButton(
                              onPressed: () async {
                                await locationData.getCurrentPosition();
                                LoadingScreen.showLoadingDialog(context, _scaffoldkey);
                                if (locationData.permissionAllowed) {
                                  locationData
                                      .getCurrentPosition()
                                      .then((value) {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              MapScreen(),
                                          transitionDuration:
                                              Duration(seconds: 2),
                                        ));
                                  });
                                } else {

                                  print('permission not allowed');
                                }
                              },
                              child: Text(
                                'Set Service Location',
                                style: TextStyle(color: BrandColors.colorGreen),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.black.withOpacity(.3),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: RichText(
                                text: TextSpan(
                                  text: 'Already a Customer?',
                                  style:
                                      TextStyle(color: BrandColors.colorMPeach),
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: BrandColors.colorMPeach),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
