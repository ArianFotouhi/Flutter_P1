import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_supercluster/flutter_map_supercluster.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Map',
      home: FlutterMapPage(),
    );
  }
}

class FlutterMapPage extends StatelessWidget {
  static final _dep = LatLng(45.5, -73.5);
  static final _arr = LatLng(27.5, 48.5);

  static final _center_lat  = (_dep.latitude + _arr.latitude)/2;
  static final _center_long = (_dep.longitude + _arr.longitude)/2;

  static final _diff_lat  = (_dep.latitude - _arr.latitude);
  static final _diff_long = (_dep.longitude - _arr.longitude);
  final double _distance = sqrt(_diff_lat * _diff_lat + _diff_long * _diff_long);
  static final _center = LatLng(_center_lat, _center_long);


  final List<Marker> _markers = [
    Marker(
      width: 80.0,
      height: 80.0,
      point: _dep, // San Francisco
      builder: (ctx) => Container(
        child: Icon(
          Icons.location_on,
          size: 50,
          color: Colors.red,
        ),
      ),
    ),
    Marker(
      width: 80.0,
      height: 80.0,
      point: _arr, // New York
      builder: (ctx) => Container(
        child: Icon(
          Icons.location_on,
          size: 50,
          color: Colors.blue,
        ),
      ),
    ),

  ];

   FlutterMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('${_distance.toString()}')),
      body: FlutterMap(
        options: MapOptions(
          center: _center,
          zoom: zoomSet(_distance),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          SuperclusterLayer.immutable(
            initialMarkers: _markers,
            indexBuilder: IndexBuilders.rootIsolate,
            builder: (context, position, markerCount, extraClusterData) =>
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      markerCount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }

  double zoomSet(_distance){
    if(_distance > 80){
      return 1;
    }
    else if(_distance<80 && _distance>60){
      return 2;
    }
   else if(_distance<60 && _distance>40){

      return 3;
    }
    else if(_distance<40 && _distance>20){

      return 4;
    }
    else if(_distance<20 && _distance>10){

      return 5;
    }
    else{
      return 6;
    }
    }
}