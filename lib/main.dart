import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'vacant.dart';
//import 'occupied.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    Vacant vacant = Vacant();
//    Occupied occupied = Occupied();
    return MaterialApp(
      title: 'Meetdicators',
      theme: ThemeData(fontFamily: 'Khand'),
      home: Scaffold(
        backgroundColor: vacant.background,
        body: vacant,
//        backgroundColor: occupied.background,
//        body: occupied,
      ),
    );
  }
}

