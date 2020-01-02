import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'bookmeeting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp(
      title: 'Meetdicator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookMeeting(title: 'Meetdicator'),
    );
  }
}

