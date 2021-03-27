import 'package:flutter/material.dart';

import 'customwidgets/brand_colors.dart';
class CallchatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BrandColors.bg,
      child: Center(child: Text('Chat Call',style: TextStyle(color: BrandColors.colorGreen),),),
    );
  }
}
