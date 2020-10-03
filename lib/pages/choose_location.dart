import 'package:flutter/material.dart';
import 'package:weather_app/services/world_weather.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // Input
  String input;
  WorldWeather obj;

  // Function to update the weather on home screen
  void updateWeather(index) async{
    WorldWeather select = WorldWeather(url: input);
    await select.getWeather();
    // Navigating ti home screen
    if(select.cod != 404) {
      alertFunc(select);
    }
    else {
      FocusScope.of(context).unfocus();

      FToast fToast = FToast();
      fToast.init(context);
      Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.red[200],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.adb),
            SizedBox(
              width: 12.0,
            ),
            Text("City not found !!"),
          ],
        ),
      );


      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 3),
      );
    }
  }

  // Alert Dialog Function to go to the home screen

  AlertDialog alertFunc(WorldWeather select) {
    showDialog(
        context: context,
      builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Found the city!\nGet the weather stats?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  obj = WorldWeather(url: input);
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                  Navigator.pop(context, {
                    "main" : select.main,
                    "description" : select.description,
                    "temperature" : select.temperature,
                    "minTemperature" : select.minTemperature,
                    "maxTemperature" : select.maxTemperature,
                    "pressure" : select.pressure,
                    "humidity" : select.humidity,
                    "country" : select.country,
                    "city" : select.city,
                    "flag" : select.flag,
                    "url" : select.url,
                    "wSpeed" : select.wSpeed,
                    "wDegree" : select.wDegree,
                    "icon" : select.icon,
                    "cod" : select.cod,
                  });
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // Create a text controller to get the value of input
    final myController = TextEditingController();

    @override
    void dispose() {
      // Clean the controller when widget is disposed
      myController.dispose();
      super.dispose();
    }

    // UI of choose location screen

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 20.0,
          ),
          autocorrect: true,
          controller: myController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.location_city),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            hintText: "Search city...",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        backgroundColor: Colors.blue[900],
        onPressed: () {
          input = myController.text;
          updateWeather(input);
        },
      ),
    );

  }

}
