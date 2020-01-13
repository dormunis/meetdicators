import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meetdicators/viewcomponents/bookmeeting.dart';
import 'package:meetdicators/viewcomponents/nextmeetings.dart';

class Vacant extends StatefulWidget {
  final events;

  Vacant({Key key, @required this.events}) : super(key: key);

  @override
  _VacantState createState() => _VacantState();
}

class _VacantState extends State<Vacant> {
  Color background = const Color(0xff00e1c9);
  static final List<String> _titles = [
    "Go on in",
    "You shall pass",
    "Yeah okay",
    "Go for it"
  ];
  final String title = _titles[Random().nextInt(_titles.length)];

  BookMeeting bookMeetingInstance() {
    if (widget.events != null && widget.events.length > 0) {
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
                    Expanded(
                      flex:2,
                      child:Container(child:new Image(image: new AssetImage("assets/images/vacant.png")))),
                    Expanded(
                      flex:6,
                      child:Container(child:Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff3f515e),
                          fontWeight: FontWeight.bold,
                          fontSize: 85),
                    ))),
                    Expanded(flex:2,child:Container())
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: bookMeetingInstance()),
              NextMeetings(events: widget.events)
            ],
          ),
        )));
  }
}
