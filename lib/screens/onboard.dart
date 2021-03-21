import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../brand_colors.dart';
import '../constants.dart';


class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final _controller = PageController(
    initialPage: 0,
  );
  int _currentpage = 0;
  List<Widget> _pages = [
    Column(
      children: [
        Expanded(
          child: Image.asset('images/enteraddress.png'),
        ),
        Text(
          'Set Your Service Location',
          style: kpageviewtextstyle,
        ),
        SizedBox(
          height: 40,
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          child: Image.asset('images/orderfood.png'),
        ),
        Text(
          'Order Online With Ease',
          style: kpageviewtextstyle,
        ),
        SizedBox(
          height: 40,
        )
      ],
    ),
    Column(
      children: [
        Expanded(
          child: Image.asset('images/deliverfood.png'),
        ),
        Text(
          'Quick Service At Your Doorstep',
          style: kpageviewtextstyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            children: _pages,
            controller: _controller,
            onPageChanged: (index) {
              setState(
                    () {
                  _currentpage = index;
                },
              );
            },
          ),
        ),
        DotsIndicator(
          dotsCount: _pages.length,
          position: _currentpage.toDouble(),
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              activeColor: BrandColors.colorGreen),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
