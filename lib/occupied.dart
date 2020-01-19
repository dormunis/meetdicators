import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:meetdicators/viewcomponents/nextmeetings.dart';

class Occupied extends StatefulWidget {
  final events;

  Occupied({Key key, @required this.events}) : super(key: key);

  @override
  _OccupiedState createState() => _OccupiedState();
}

class _OccupiedState extends State<Occupied> {
  Color background = const Color(0xfff7635e);
  static String _dateFormat = "HH:mm";
  var _currentEvent;

  static final List<String> _titles = [
    "Nope",
    "Denied",
    "You shall not pass",
    "Boohoo"
  ];
  final String title = _titles[Random().nextInt(_titles.length)];

  @override
  void initState() {
    _currentEvent = widget.events[0];
    super.initState();
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  String convertEmailToName(String email) {
    String rawName = email.substring(0, email.indexOf("@"));
    return rawName.split('.').map((name) => capitalize(name)).join(" ");
  }

  List<Widget> generateAttendees() {
    List<Widget> attendees = [];
    for (var attendee in _currentEvent['attendees']) {
      attendees.add(Container(
        child: Flexible(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Text(
                convertEmailToName(attendee),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 40),
              )
            ])),
      ));
    }
    return attendees;
  }

  @override
  Widget build(BuildContext context) {
    List attendees = generateAttendees();
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
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Container(
                          child: new Image(
                              image: new AssetImage(
                                  "assets/images/occupied.png")))),
                  Expanded(
                      flex: 6,
                      child: Container(
                          child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xff3f515e),
                            fontWeight: FontWeight.bold,
                            fontSize: 85),
                      ))),
                  Expanded(flex: 2, child: Container())
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _currentEvent['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff3f515e),
                          fontWeight: FontWeight.bold,
                          fontSize: 64),
                    )),
                    Expanded(
                        child: Text(
                      "${DateFormat(_dateFormat).format(_currentEvent['start'])} - ${DateFormat(_dateFormat).format(_currentEvent['end'])}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff3f515e), fontSize: 50),
                    )),
                  ]),
            ),
            Container(
              color: const Color(0xff3f515e),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: CarouselSlider(
                enlargeCenterPage: true,
                items: attendees,
                enableInfiniteScroll: false,
                initialPage: (attendees.length / 2).floor(),
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.33,
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: NextMeetings(events: widget.events.sublist(1))),
          ],
        ),
      )),
    );
  }
}
