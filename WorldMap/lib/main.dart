import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_supercluster/flutter_map_supercluster.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
   MyApp() {}

  late final LatLng _dep = LatLng(45.5, 47.5);
  late final LatLng _arr = LatLng(27.5, 48.5);
   late final List<LatLng> _points = [LatLng(35.5, 0.5),LatLng(40.5, -17.5)];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Map'),
        ),
        body: Container(
          padding: const EdgeInsets.all(50),
          child: FlutterMapPage(
              map_points: _points,
          ),
        ),
      ),
    );
  }
}

class FlutterMapPage extends StatelessWidget {
  final List<LatLng> map_points;


  FlutterMapPage({
    required this.map_points,

  })

  {
    double zoomSet(List<LatLng> points) {
      if (points.length < 2) {
        return 5;
      }

      List<double> distances =[];

      for (int i = 0; i < points.length - 1; i++) {
        final double _diff_lat = (points[i].latitude - points[i + 1].latitude);
        final double _diff_long = (points[i].longitude - points[i + 1].longitude);

        final double _distance =
        sqrt(_diff_lat * _diff_lat + _diff_long * _diff_long);

        distances.add(_distance);      }

      // double Distance = totalDistance / (points.length - 1);
      double Distance = distances.isNotEmpty ? distances.reduce(max) : 0;

      if (Distance > 80) {
        return 1;
      } else if (Distance < 80 && Distance > 60) {
        return 1;

      } else if (Distance < 60 && Distance > 40) {
        if(map_points.length ==2){return 2;}  else{return 1;}

      } else if (Distance < 40 && Distance > 20) {
        if(map_points.length ==2){return 3;}  else{return 2;}

      } else if (Distance < 20 && Distance > 10) {
        if(map_points.length ==2){return 4;}  else{return 3;}

      } else {
        if(map_points.length ==2){return 5;}  else{return 4;}

      }
    }
    _zoom = zoomSet(map_points);

    LatLng centerSet(List<LatLng> points) {
      if (points.isEmpty) {
        return LatLng(0, 0);
      }

      double totalLat = 0;
      double totalLong = 0;

      for (int i = 0; i < points.length; i++) {
        totalLat += points[i].latitude;
        totalLong += points[i].longitude;
      }

      double centerLat = totalLat / points.length;
      double centerLong = totalLong / points.length;

      return LatLng(centerLat, centerLong);
    }

    _center =  centerSet(map_points);

    List<Marker> createMarkers(List<LatLng> points) {
      return points.map((LatLng point) {
        return Marker(
          width: 80.0,
          height: 80.0,
          point: point,
          builder: (ctx) => Container(
            child: Icon(
              Icons.location_on,
              size: 50,
              color: Colors.red,
            ),
          ),
        );
      }).toList();
    }

    _markers =createMarkers(map_points);
  }

  late final List<Marker> _markers;
  late final LatLng _center;
  late final double _zoom;



  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: _center,
        zoom: _zoom,
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
    );
  }
}
