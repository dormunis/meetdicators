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