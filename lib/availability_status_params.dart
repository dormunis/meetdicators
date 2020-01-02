import 'package:flutter/material.dart';

abstract class AvailabilityStatusParams {
  final String status;
  final Color backgroundColor;
  final TextStyle textStyle = TextStyle(
      fontSize: 58,
      color: Colors.black87,
      fontFamily: 'Khand',
      fontWeight: FontWeight.bold);

  AvailabilityStatusParams({this.status, this.backgroundColor});

//Widget getAction();
}

class Vacant extends AvailabilityStatusParams {
  Vacant() : super(status: 'Go Ahead', backgroundColor: Colors.greenAccent);
}

class StartsSoon extends AvailabilityStatusParams {
  StartsSoon()
      : super(
            status: 'Enter at your own peril',
            backgroundColor: Colors.yellowAccent);
}

class Occupied extends AvailabilityStatusParams {
  Occupied()
      : super(
          status: 'Nope',
          backgroundColor: Colors.yellowAccent,
        );
}
