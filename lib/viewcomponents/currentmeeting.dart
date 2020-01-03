import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:occupied_room/google/calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CurrentMeeting extends StatefulWidget {
  @override
  _CurrentMeetingState createState() => _CurrentMeetingState();
}

class _CurrentMeetingState extends State<CurrentMeeting> {
  List _events;
  static String _dateTimeFormat = "HH:mm";

  Future<void> populateEvents() async {
    _events = (await getCalendarEvents('einstein')).sublist(0);
  }

  Container generateEventView(event) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Column(children: <Widget>[
            Text(
              event['title'],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ])),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
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
                    ])
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: populateEvents(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Press button to start');
          case ConnectionState.waiting:
            return new Text('Awaiting results from Meeting API...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
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
                  Container(
                      color: const Color(0xff3f515e),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: CarouselSlider(
                          enableInfiniteScroll: false,
                          items: _events.map((event) {
                            return generateEventView(event);
                          }).toList())),
                ],
              );
        }
      },
    );
  }
}
