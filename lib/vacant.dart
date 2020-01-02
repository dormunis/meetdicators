import 'package:flutter/material.dart';
import '_availability_status_params.dart';

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