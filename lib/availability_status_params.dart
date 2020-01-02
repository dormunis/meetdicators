import 'package:flutter/material.dart';

abstract class AvailabilityStatusParams {
  final String status;
  final Color backgroundColor;
  final TextStyle textStyle = TextStyle(
      fontSize: 80,
      color: Colors.black87,
      fontFamily: 'Khand',
      fontWeight: FontWeight.bold);

  AvailabilityStatusParams({this.status, this.backgroundColor});

  Widget getAction();
}

class Vacant extends AvailabilityStatusParams {
  Vacant() : super(status: 'Go Ahead', backgroundColor: Colors.greenAccent);

  Widget getAction() {
    return Column (
      children: <Widget>[
        Text("Current Meeting", textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontFamily: 'Khand',
                fontWeight: FontWeight.bold)),
        Text("meeting name", textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontFamily: 'Khand',
                fontWeight: FontWeight.bold)),
        Text("10:30-11:00", textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontFamily: 'Khand',
                fontWeight: FontWeight.bold)),
        Text("Ben, Shayna, Ronny, DorB, TomerS", textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontFamily: 'Khand',
                fontWeight: FontWeight.bold))
      ],
    );
  }
}

class StartsSoon extends AvailabilityStatusParams {
  StartsSoon()
      : super(
            status: 'Enter at your own peril',
            backgroundColor: Colors.yellowAccent);

  Widget getAction() {
    return Column (
      children: <Widget>[
        Text("CurrentMeeting",
            textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 58,
            color: Colors.black87,
            fontFamily: 'Khand',
            fontWeight: FontWeight.bold))
      ],
    );
  }
}

class Occupied extends AvailabilityStatusParams {
  Occupied()
      : super(
          status: 'Nope',
          backgroundColor: Colors.redAccent,
        );

  Widget getAction() {
    return Column (
      children: <Widget>[
        Text("Current Meeting", textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontFamily: 'Khand',
                fontWeight: FontWeight.bold)),
        Text("meeting name", textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontFamily: 'Khand',
                fontWeight: FontWeight.bold)),
        Text("10:30-11:00", textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontFamily: 'Khand',
                fontWeight: FontWeight.bold)),
        Text("Ben, Shayna, Ronny, DorB, TomerS", textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontFamily: 'Khand',
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
