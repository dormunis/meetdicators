import 'package:flutter/material.dart';

class AvailabilityStatusParams {
  final String status;
  final Color backgroundColor;
  AvailabilityStatusParams({this.status, this.backgroundColor});
}

class Vacant extends AvailabilityStatusParams {
  Vacant():
        super(
          status: 'Go Ahead',
          backgroundColor: Colors.greenAccent
      );
}

class StartsSoon extends AvailabilityStatusParams {
  StartsSoon():
        super(
          status: 'Enter at your own peril',
          backgroundColor: Colors.yellowAccent
      );
}

class Occupied extends AvailabilityStatusParams {
  Occupied():
        super(
          status: 'Nope',
          backgroundColor: Colors.yellowAccent
      );
}