import 'dart:async';
import 'package:wakelock/wakelock.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'vacant.dart';
import 'occupied.dart';


import 'google/calendar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    Wakelock.enable();
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

  var _events;

  Future<void> getRoomAvailability() async {
    _events = await getCalendarEvents('einstein');
  }

  bool isRoomOccupied() {
    return _events.isNotEmpty && _events[0]['start'].isBefore(DateTime.now().add(Duration(minutes: 5)));
  }

  Future _update(Timer t) async {
    await getRoomAvailability();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {

    new Timer.periodic(new Duration(seconds:60), _update);

    return FutureBuilder<Object>(
      future: getRoomAvailability(),
      builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Press button to start');
//          case ConnectionState.waiting:
//            return new Text('Awaiting results from Meeting API...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else {
              if (_events != null && isRoomOccupied()) {
                return Occupied(events: _events);
              } else {
                return Vacant(events: _events);
              }
            }
        }
      },
    );
  }
}
