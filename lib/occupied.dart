import 'package:flutter/material.dart';
import 'package:occupied_room/viewcomponents/currentmeeting.dart';

class Occupied extends StatefulWidget {
  Color background = const Color(0xfff7635e);

  @override
  _OccupiedState createState() => _OccupiedState();
}

class _OccupiedState extends State<Occupied> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
      constraints: BoxConstraints(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Nope",
                style: TextStyle(
                    color: const Color(0xff3f515e),
                    fontWeight: FontWeight.bold,
                    fontSize: 72),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              "Current Meeting:",
              style: TextStyle(
                  color: const Color(0xff3f515e),
                  fontWeight: FontWeight.bold,
                  fontSize: 42),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              "Manually set meeting",
              style: TextStyle(
                  color: const Color(0xff3f515e),
                  fontSize: 32),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              "10:30 - 11:00",
              style: TextStyle(
                  color: const Color(0xff3f515e),
                  fontSize: 32),
            ),
          ]),
          CurrentMeeting()
        ],
      ),
    ));
  }
}
