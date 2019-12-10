import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/loading_screen.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
  var data;
  WeatherScreen(this.data);
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
  }

  final myController = TextEditingController();
  bool textFieldVisible = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String imgString = widget.data['weather'][0]['icon'];
    String dayOrNight = imgString.substring(imgString.length - 1);
    String bgImg = (dayOrNight == 'd' ? 'day.png' : 'night.png');
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.transparent,
//        elevation: 0.0,
//        actions: <Widget>[
//          Expanded(
//            child: Padding(
//              padding: const EdgeInsets.only(
//                  top: 10, bottom: 10, left: 60, right: 20),
//              child: Visibility(
//                child: TextField(
//                  cursorColor: Colors.white,
//                  autofocus: true,
//                  decoration: InputDecoration(
//                    //filled: true,
//                    //contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
//                    isDense: true,
//                    focusedBorder: OutlineInputBorder(
//                      borderRadius: BorderRadius.all(
//                        const Radius.circular(20.0),
//                      ),
//                      borderSide: BorderSide(width: 0.0, color: Colors.white),
//                    ),
//                    fillColor: Colors.white,
//                    focusColor: Colors.white,
//
//                    border: OutlineInputBorder(
//                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
//                    ),
//                    suffixIcon: IconButton(
//                      icon: Icon(
//                        Icons.search,
//                        color: Colors.white,
//                      ),
//                      onPressed: () {
//                        Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) =>
//                                    LoadingScreen(myController.text)));
//                      },
//                    ),
//                  ),
//                  textAlignVertical: TextAlignVertical.top,
//                  textAlign: TextAlign.center,
//                  controller: myController,
//                ),
//                visible: textFieldVisible,
//              ),
//            ),
//          ),
//          IconButton(
//            icon: Icon(Icons.location_city),
//            onPressed: () {
//              setState(() {
//                textFieldVisible = !textFieldVisible;
//              });
//            },
//          ),
//        ],
//      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/night.png'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${widget.data['name']}',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${widget.data['main']['temp'].toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 150,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          '˚f',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        widget.data['weather'][0]['main'],
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Image.network(
                        'http://openweathermap.org/img/wn/$imgString.png',
                        scale: 1,
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Text(
                        '${widget.data['weather'][0]['description']}',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// Testing