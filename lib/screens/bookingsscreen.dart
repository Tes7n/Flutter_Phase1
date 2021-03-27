import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'customwidgets/brand_colors.dart';

class BookingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BrandColors.bg,
      child: Center(
        child: Text(
          'bookings!',
          style: TextStyle(color: BrandColors.colorGreen),
        ),
      ),
    );
  }
}
