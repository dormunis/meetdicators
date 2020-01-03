import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:occupied_room/viewcomponents/currentmeeting.dart';

class Occupied extends StatefulWidget {
  final event;

  Occupied({Key key, @required this.event}) : super(key: key);

  @override
  _OccupiedState createState() => _OccupiedState();
}

class _OccupiedState extends State<Occupied> {
  Color background = const Color(0xfff7635e);
  static String _dateFormat = "HH:mm";

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  String convertEmailToName(String email) {
    String rawName = email.substring(0, email.indexOf("@"));
    return rawName.split('.').map((name) => capitalize(name)).join(" ");
  }

  List<Widget> generateAttendeesListView() {
    List<Widget> attendees = [];
    for (var attendee in widget.event['attendees']) {
      attendees.add(Container(
        width: MediaQuery.of(context).size.width * 0.2,
        child: Text(
          convertEmailToName(attendee),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24),
        ),
      ));
    }
    return attendees;
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
              Expanded(
                  child: Text(
                widget.event['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff3f515e),
                    fontWeight: FontWeight.bold,
                    fontSize: 42),
              )),
              Expanded(
                  child: Text(
                "${DateFormat(_dateFormat).format(widget.event['start'])} - ${DateFormat(_dateFormat).format(widget.event['end'])}",
                textAlign: TextAlign.center,
                style: TextStyle(color: const Color(0xff3f515e), fontSize: 32),
              )),
            ]),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1,
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: generateAttendeesListView(),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[]),
            CurrentMeeting()
          ],
        ),
      )),
    );
  }
}
