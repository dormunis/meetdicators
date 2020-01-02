import 'package:flutter/material.dart';

class CurrentMeeting extends StatefulWidget {
  @override
  _CurrentMeetingState createState() => _CurrentMeetingState();
}

class _CurrentMeetingState extends State<CurrentMeeting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            "Next meetings:",
            style: TextStyle(
                color: const Color(0xff3f515e),
                fontWeight: FontWeight.bold,
                fontSize: 42),
          ),
        ]),
        Container(
          color: const Color(0xff3f515e),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Kaka bepita",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  "\t\t-\t\t",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  "10:00 - 11:30",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )
              ]),
        )
      ],
    );
  }
}
