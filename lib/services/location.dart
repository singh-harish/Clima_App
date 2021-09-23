import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitute;

  Future<void> getCurrentLocation() async {
    try { 
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude=position.longitude;
      latitute=position.latitude;
    }
    catch(e){
      print(e);
    }
  }
}


