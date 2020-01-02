import 'package:flutter/material.dart';

class Meeting {
  final String name;
  final String hours;

  Meeting({this.name, this.hours});
}

class NextMeetingsWidgetState extends State<NextMeetingsWidget> {
  final Set<Meeting> _todaysMeetings = Set<Meeting>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey),
        margin: EdgeInsets.fromLTRB(100.0, 0, 100, 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Hello World!!",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 80,
                color: Colors.black87,
                fontFamily: 'Khand',
                fontWeight: FontWeight.bold),
          ),
        ]));
  }
}

class NextMeetingsWidget extends StatefulWidget {
  @override
  NextMeetingsWidgetState createState() => NextMeetingsWidgetState();
}
