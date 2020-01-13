import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NextMeetings extends StatefulWidget {
  final events;

  NextMeetings({Key key, @required this.events}) : super(key: key);

  @override
  _NextMeetingsState createState() => _NextMeetingsState();
}

class _NextMeetingsState extends State<NextMeetings> {
  static String _dateTimeFormat = "HH:mm";
  final double _fontSize = 40;

  Row generateEventTime(event) {
    if (event.containsKey('start') && event.containsKey('end')) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat(_dateTimeFormat).format(event['start']),
              style: TextStyle(color: Colors.white, fontSize: _fontSize),
            ),
            Text(
              "-",
              style: TextStyle(color: Colors.white, fontSize: _fontSize),
            ),
            Text(
              DateFormat(_dateTimeFormat).format(event['end']),
              style: TextStyle(color: Colors.white, fontSize: _fontSize),
            )
          ]);
    } else {
      return Row();
    }
  }

  Container generateEventView(event) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text(
                  event['title'],
                  style: TextStyle(color: Colors.white, fontSize: _fontSize),
                )
              ])),
          Expanded(
            child: Column(
              children: <Widget>[Expanded(child: generateEventTime(event))],
            ),
          )
        ],
      ),
    );
  }

  List getEvents() {
    if (widget.events != null) {
      return widget.events;
    }
    return [
      {"title": "Loading meetings..."}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.15,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Next meetings:",
                  style: TextStyle(
                      color: const Color(0xff3f515e),
                      fontWeight: FontWeight.bold,
                      fontSize: 55),
                ),
              ]),
        ),
        Container(
            color: const Color(0xff3f515e),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: CarouselSlider(
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                items: getEvents().map((event) {
                  return generateEventView(event);
                }).toList())),
      ],
    );
  }
}
