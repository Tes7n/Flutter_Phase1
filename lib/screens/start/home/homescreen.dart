import 'package:flutter/material.dart';
import 'package:flutter_1nep/screens/customwidgets/imageslider.dart';
import 'package:flutter_1nep/screens/customwidgets/toppickedstore.dart';
import 'package:flutter_1nep/screens/offerscreen.dart';

import '../../customwidgets/brand_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor)
          ..rotateY(isDrawerOpen ? -0.5 : 0),
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
            color: BrandColors.bg,
            borderRadius: BorderRadius.circular(isDrawerOpen ? 40.0 : 0.0)),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: BrandColors.bg,
                borderRadius: BorderRadius.circular(isDrawerOpen ? 40.0 : 0.0)),


              child: Column(
                children: [
                     SizedBox(
                      height: 15.0,
                    ),
//appbar row
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
//profile Icon
                          isDrawerOpen
                              ? IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: BrandColors.colorGreen2,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      xOffset = 0;
                                      yOffset = 0;
                                      scaleFactor = 1;
                                      isDrawerOpen = false;
                                    });
                                  },
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      xOffset = 180;
                                      yOffset = 70;
                                      scaleFactor = 0.8;
                                      isDrawerOpen = true;
                                    });
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.account_circle_outlined,
                                          color: BrandColors.colorGreen2,
                                          size: 40,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12.0, left: 8.0),
                                          child: Text(
                                            'Profile',
                                            style: TextStyle(
                                                color: BrandColors.colorGreen2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
//offer Icon
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OfferScreen(),
                                  ));
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.0),
                                    child: Text(
                                      'OFFERS!',
                                      style:
                                          TextStyle(color: BrandColors.colorGreen2),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Icon(
                                      Icons.whatshot_outlined,
                                      color: BrandColors.colorGreen2,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
//banner
                    ImageSlider(),
//topPicked
                    Container(height: 110,
                        child: TopPickedStore()),

                ],
              ),
            ),
          ),
        ),

    );
  }
}
