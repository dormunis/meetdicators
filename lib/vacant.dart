import 'package:flutter/material.dart';
import 'package:occupied_room/viewcomponents/bookmeeting.dart';
import 'package:occupied_room/viewcomponents/currentmeeting.dart';

class Vacant extends StatefulWidget {
  Color background = const Color(0xff00e1c9);

  @override
  _VacantState createState() => _VacantState();
}

class _VacantState extends State<Vacant> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Container(child: BookMeeting()),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            const RaisedButton(
              onPressed: null,
              color: const Color(0xff3f515e),
              child: Text('BOOK ROOM', style: TextStyle(fontSize: 40)),
            )
          ]),
          CurrentMeeting()
        ],
      ),
    ));
  }
}
