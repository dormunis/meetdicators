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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Icon(Icons.favorite, color: Colors.pink),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                  'bla',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
              ),
            )
          ],
        )
    ); //);
  }
}

class NextMeetingsWidget extends StatefulWidget {
  @override
  NextMeetingsWidgetState createState() => NextMeetingsWidgetState();
}
