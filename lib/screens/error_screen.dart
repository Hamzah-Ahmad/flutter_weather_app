import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/loading_screen.dart';

class ErrorScreen extends StatelessWidget {
  String errorText;
  ErrorScreen(this.errorText);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(errorText),
            FlatButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
              },
              color: Colors.grey,
              child: Text('Go Back'),
            )
          ],
        ),
      )
    );
  }
}
