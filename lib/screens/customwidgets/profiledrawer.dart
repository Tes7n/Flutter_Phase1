import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1nep/screens/customwidgets/brand_colors.dart';

import 'branddivider.dart';

class ProfileDrawer extends StatefulWidget {
  @override
  _ProfileDrawerState createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BrandColors.colorGreen3,
      padding: EdgeInsets.only(top:20,bottom: 70,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //profile row
          Row(
            children: [
              Icon(Icons.account_circle_outlined,color: BrandColors.colorTextDark,size: 45,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  SizedBox(height: 4.0,),
                  Text('+91 ${phone}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),



          // BrandDivider(),
          // SizedBox(width: 50,),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Address',
              style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
            ),

          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text(
              'Payment',
              style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text(
              'Support',
              style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'LogOut',
              style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'About',
              style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
            ),
          ),
          //Logout row

        ],
      ),

    );
  }
  @override
  void initState() {
    // TODO: implement initState
    phone = FirebaseAuth.instance.currentUser.phoneNumber;
  }
}