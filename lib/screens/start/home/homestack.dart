import 'package:flutter/material.dart';
import 'package:flutter_1nep/screens/customwidgets/brand_colors.dart';
import 'package:flutter_1nep/screens/start/home/startscreen.dart';
import 'package:flutter_1nep/screens/start/home/homescreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../customwidgets/profiledrawer.dart';


class HomeStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BrandColors.bg,
        body: Stack(
          children: [
            ProfileDrawer(),
            HomeScreen(),


          ],
        ),

      ),

    );
  }
}
