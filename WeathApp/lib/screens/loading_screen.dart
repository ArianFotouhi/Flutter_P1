import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

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
    Location location = Location();
    await location.getCurrentLocation();
  }

  void getData() async {
    double lat = 37;
    double lon = -122;
    String apiKey = 'd6230bcde1fd2213019455f7789e139e';
    Uri apiUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');

    http.Response response = await http.get(apiUrl);
    String data = response.body;
    var temperature = jsonDecode(data)['main']['temp'];
    var condition = jsonDecode(data)['weather'][0]['id'];
    var cityName = jsonDecode(data)['name'];
    print(data);
    print(temperature);
    print(condition);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
