import 'package:flutter/material.dart';
import 'package:occupied_room/viewcomponents/bookmeeting.dart';
import 'package:occupied_room/viewcomponents/currentmeeting.dart';

class Vacant extends StatefulWidget {
  final events;

  Vacant({Key key, @required this.events}) : super(key:key);

  @override
  _VacantState createState() => _VacantState();
}

class _VacantState extends State<Vacant> {
  Color background = const Color(0xff00e1c9);

  Widget bookMeeting = BookMeeting();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
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
                    "Go on in",
                    style: TextStyle(
                        color: const Color(0xff3f515e),
                        fontWeight: FontWeight.bold,
                        fontSize: 72),
                  ),
                ],
              ),
              Container(child: bookMeeting),
              CurrentMeeting(events: widget.events)
            ],
          ),
        )));
  }
}
