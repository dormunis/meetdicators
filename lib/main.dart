import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:occupied_room/vacant.dart';
import 'package:occupied_room/occupied.dart';

import 'google/calendar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp(
      title: 'Meetdicators',
      theme: ThemeData(fontFamily: 'Khand'),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _event;

  Future<void> getRoomAvailability() async {
    _event = await getCurrentMeeting('einstein');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: getRoomAvailability(),
      builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Press button to start');
          case ConnectionState.waiting:
            return new Text('Awaiting results from Meeting API...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else {
              if (_event != null) {
                return Occupied(event: _event);
              } else {
                return Vacant();
              }
            }
        }
      },
    );
  }
}
