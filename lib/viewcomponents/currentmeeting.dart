import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CurrentMeeting extends StatefulWidget {
  final events;

  CurrentMeeting({Key key, @required this.events}) : super(key: key);

  @override
  _CurrentMeetingState createState() => _CurrentMeetingState();
}

class _CurrentMeetingState extends State<CurrentMeeting> {
  static String _dateTimeFormat = "HH:mm";

  Row generateEventTime(event) {
    if (event.containsKey('start') && event.containsKey('end')) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat(_dateTimeFormat).format(event['start']),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              "-",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              DateFormat(_dateTimeFormat).format(event['end']),
              style: TextStyle(color: Colors.white, fontSize: 24),
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
              child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  event['title'],
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
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
          height: MediaQuery.of(context).size.height * 0.15,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Next meetings:",
                  style: TextStyle(
                      color: const Color(0xff3f515e),
                      fontWeight: FontWeight.bold,
                      fontSize: 42),
                ),
              ]),
        ),
        Container(
            color: const Color(0xff3f515e),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: CarouselSlider(
                enableInfiniteScroll: false,
                items: getEvents().map((event) {
                  return generateEventView(event);
                }).toList())),
      ],
    );
  }
}
