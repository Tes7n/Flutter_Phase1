import 'package:flutter/material.dart';
import 'package:flutter_1nep/provider/locationprovider.dart';
import 'package:provider/provider.dart';
class MapScreen extends StatefulWidget {

  static const String id = 'map-screen';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bg.png'), fit: BoxFit.cover),
              ),
              child: Center(
                child: Text('${locationData.longtitude} : ${locationData.latitude}'  ),
              ),
            ),
          ),
        ));
  }
}
