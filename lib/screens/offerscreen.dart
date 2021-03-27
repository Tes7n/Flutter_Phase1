import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'customwidgets/brand_colors.dart';

class OfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text('OFFERS!'),backgroundColor: BrandColors.colorGreen3,),body: Container(
      color: BrandColors.bg,
      child: Center(
        child: Text(
          'offers!',
          style: TextStyle(color: BrandColors.colorGreen),
        ),
      ),
    ),),);
  }
}
