import 'package:flutter/material.dart';

import 'package:flutter_1nep/screens/customwidgets/brand_colors.dart';

import 'package:flutter_1nep/screens/bookingsscreen.dart';
import 'package:flutter_1nep/screens/callchatscreen.dart';
import 'package:flutter_1nep/screens/start/home/homestack.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  ShapeBorder customBottomBarShape1 = BeveledRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0), topRight: Radius.circular(0)),
  );

  Color backgroundColor = BrandColors.colorGreen3;
  Color snakeViewColor = Colors.black;
  Color selectedItemColor = BrandColors.colorGreen3;
  Color unselectedItemColor = Colors.black;

  int _selectedItemPosition = 1;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedItemPosition);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BrandColors.bg,
        body: AnimatedContainer(
          duration: Duration(seconds: 1),
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedItemPosition = index;
              });
            },
            children: <Widget>[
              BookingsScreen(),
              HomeStack(),
              CallchatScreen(),
            ],
          ),
        ),
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.rectangle,
          shape: customBottomBarShape1,
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,

          ///configuration for SnakeNavigationBar.color
          snakeViewColor: snakeViewColor,
          selectedItemColor: selectedItemColor,

          unselectedItemColor: unselectedItemColor,

          showUnselectedLabels: true,
          showSelectedLabels: true,

          currentIndex: _selectedItemPosition,
          onTap: (index) {
            this._pageController.animateToPage(index,
                duration: Duration(milliseconds: 5), curve: Curves.easeIn);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.article_outlined), label: 'Bookings'),
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_phone_msg_outlined), label: 'Call-Chat'),
          ],
        ),
      ),
    );
  }
}
