import 'package:climate/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }
  void getLocation() async {
    var location =  Location();
    await location.getCurrentLocation();
    print(location.latitute);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=8a8869354d21259e8c49de9134d48511'));
    if(response.statusCode==200){
      String result = response.body;
      //print(result);
      var temperature = jsonDecode(result)['main']['temp'];
      var condition = jsonDecode(result)['weather'][0]['id'];
      var cityName = jsonDecode(result)['name'];
      print(temperature);
      print(condition);
      print(cityName);

    }
    else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
