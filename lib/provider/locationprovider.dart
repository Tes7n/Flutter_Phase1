import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';


class LocationProvider with ChangeNotifier{

  double latitude;
  double longtitude;
  bool permissionAllowed = false;

  Future<void> getCurrentPosition()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (position!=null){
      this.latitude=position.latitude;
      this.longtitude=position.longitude;
      this.permissionAllowed=true;
      notifyListeners();
    }
    else {
      print('permission not allowed');
    }
  }
}
