import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/world_weather.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWeather() async {

    WorldWeather instance = WorldWeather(url: "London");
    await instance.getWeather();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "main": instance.main,
      "description": instance.description.toString(),
      "temperature": instance.temperature,
      "minTemperature": instance.minTemperature,
      "maxTemperature": instance.maxTemperature,
      "pressure": instance.pressure,
      "humidity": instance.humidity,
      "city": instance.city,
      "country": instance.country,
      "wSpeed": instance.wSpeed,
      "wDegree": instance.wDegree,
      "icon" : instance.icon,
      "flag" : instance.flag,
      "cod" : instance.cod,
    });
  }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      setupWeather();
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: SpinKitHourGlass(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      );
    }
  }


  /*
  // Setup World time
    String time = "loading...";

    void setupWorldTime() async {
      WorldTime instance = WorldTime(url: "Asia/Kolkata");
      await instance.getTime();
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "time": instance.time,
      });  */