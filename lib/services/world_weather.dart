import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
// key =  55a8fc22ba52865596d4f1d73bf8117d

class WorldWeather {
  String flag;
  String url; // for api access
  String main;
  String description;
  double temperature;
  double minTemperature;
  double maxTemperature;
  int pressure;
  int humidity;
  String country;
  String city;
  double wSpeed;
  int wDegree;
  String icon;
  int cod;

  WorldWeather({this.url});

  Future<void> getWeather() async {
    try {
      Response response = await get("http://api.openweathermap.org/data/2.5/weather?q=$url&appid=55a8fc22ba52865596d4f1d73bf8117d");
      Map data = jsonDecode(response.body);
      print(data);
      List weatherList = data["weather"];
      main = weatherList[0]["main"];
      icon = weatherList[0]["icon"];
      description = weatherList[0]["description"];
      Map temperatureList = data["main"];
      temperature = (temperatureList["temp"]);
      minTemperature = (temperatureList["temp_min"]);
      maxTemperature = (temperatureList["temp_max"]);
      pressure = (temperatureList["pressure"]);
      humidity = (temperatureList["humidity"]);
      Map sys = data["sys"];
      country = sys["country"];
      city = data["name"];
      Map windList = data["wind"];
      wSpeed = windList["speed"];
      wDegree = windList["deg"];
      cod = data["cod"];
      print(icon);
    }
    catch(e) {
      print(e);
      print("Unable to get the weather data");
      cod = 404;
    }
  }
}