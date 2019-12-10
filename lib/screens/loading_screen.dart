import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../location.dart';
import './weather_screen.dart';
import 'error_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();

  String cityName;
  LoadingScreen([this.cityName]);

}

class _LoadingScreenState extends State<LoadingScreen> {

  double longitude;
  double latitude;

  @override
  void initState(){
    super.initState();
    getLocation();
  }
//
//  void getData(){
//    print(widget.data);
//  }
  void getLocation() async{
    try{
      Location location = Location();
      await location.getLocation();
      longitude = location.longitude;
      latitude = location.latitude;
      //print('test');
      getData();

    }
    catch(e){
      print(e);
    }
  }

  Future<void> getData([cityName]) async {
    Response response;
    if(widget.cityName!= null){
      response = await get('https://api.openweathermap.org/data/2.5/weather?q=${widget.cityName}&units=imperial&appid=c097576f27f48e42a9dbf5b272df8457');
    }else{
      response = await get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=imperial&appid=c097576f27f48e42a9dbf5b272df8457');
    }
    if(response.statusCode == 200){
      String data = response.body;
      var convertedData = jsonDecode(data);
      //print(convertedData);
      cityName = await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WeatherScreen(convertedData)));
    }
    else{
      var responseText = jsonDecode(response.body);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ErrorScreen(responseText['message']))) ;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRipple(
          color: Colors.blue,
          size: 100.0,
        ),
      ),

    );
  }
}
