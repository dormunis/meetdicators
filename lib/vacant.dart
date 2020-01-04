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

  BookMeeting bookMeetingInstance() {
    if (widget.events != null) {
      return BookMeeting(closestMeeting: widget.events[0]);
    } else {
      return BookMeeting();
    }
  }

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
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Row(
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
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: bookMeetingInstance()
              ),
              CurrentMeeting(events: widget.events)
            ],
          ),
        )));
  }
}
