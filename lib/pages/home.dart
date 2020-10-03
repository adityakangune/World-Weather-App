import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //print(data);

    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, "/location");
                      setState(() {
                        data = {
                          "main" : result["main"],
                          "description" : result["description"],
                          "temperature" : result["temperature"],
                          "minTemperature" : result["minTemperature"],
                          "maxTemperature" : result["maxTemperature"],
                          "pressure" : result["pressure"],
                          "humidity" : result["humidity"],
                          "country" : result["country"],
                          "city" : result["city"],
                          "flag" : result["flag"],
                          "url" : result["url"],
                          "wSpeed" : result["wSpeed"],
                          "wDegree" : result["wDegree"],
                          "icon" : result["icon"],
                          "cod" : result["cod"],
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                    ),
                    label: Text(
                      "Edit location",
                      style: TextStyle(
                        color: Colors.grey[300],
                        letterSpacing: 5.0,
                        fontSize: 20.0,
                      ),
                    ),
                ),
                SizedBox(height: 20.0),
                Text(
                  data["city"] + " " + data["country"],
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 3.0,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/${data["icon"]}.png"),
                      backgroundColor: Colors.transparent,
                      radius: 60.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          data["main"].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            letterSpacing: 2.0,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data["description"].toString(),
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 25.0,
                            //letterSpacing:1.5,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                const Divider(
                  color: Colors.white24,
                  height: 20,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        //SizedBox(height: 10.0),
                      ],
                    ),
                  ],
                ),
                //SizedBox(height: 20.0),
                Container(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            (data["temperature"]-273).toStringAsFixed(0) + "°C" ,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 70.0,
                              //fontWeight: FontWeight.bold,
                              letterSpacing: 5.0,
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "min",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20.0,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text(
                                      (data["minTemperature"]-273).toStringAsFixed(0) + " °C",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        //letterSpacing: 1.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalDivider(
                                  width: 20,
                                  color: Colors.white24,
                                  thickness: 1.0,
                                  indent: 10.0,
                                  endIndent:10.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "max",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20.0,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text(
                                      (data["maxTemperature"]-273).toStringAsFixed(0) + " °C",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        //letterSpacing: 1.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text("wind"),
                        ],
                      ),

                    ],
                  ),
                ),
                //SizedBox(height: 20.0),
                const Divider(
                  color: Colors.white24,
                  height: 20,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                ),
                Text(
                  "WIND",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "speed",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              letterSpacing: 1.0,
                            ),
                          ),
                          Text(
                            data["wSpeed"].toString() + " m/sec",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              //letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                      // const VerticalDivider(
                      //   width: 20,
                      //   color: Colors.white24,
                      //   thickness: 1.0,
                      //   //indent: 10,
                      //   //endIndent: 10,
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "degree",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              letterSpacing: 1.0,
                            ),
                          ),
                          Text(
                            data["wDegree"].toString() + "°",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              //letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white24,
                  height: 20,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                ),
                Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Pressure",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                            ),
                          ),
                          Text(
                            data["pressure"].toString() + " hPa",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              //letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        width: 20,
                        color: Colors.white24,
                        thickness: 1.0,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Humidity",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                            ),
                          ),
                          Text(
                            data["humidity"].toString() + "%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              //letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: 20.0),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
