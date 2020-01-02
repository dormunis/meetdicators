import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class AvailabilityStatusParams {
  final String status;
  final Color backgroundColor;
  AvailabilityStatusParams({this.status, this.backgroundColor});
}

class Vacant extends AvailabilityStatusParams {
  Vacant():
        super(
          status: 'Go Ahead2',
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Vacancy',
//      home: Availability(),
//    );
    return Container(
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Availability());
  }
}

enum AvailabilityStatus { vacant, startsSoon, occupied }

class AvailabilityState extends State<Availability> {
  AvailabilityStatus _status = AvailabilityStatus.vacant;

  @override
  Widget build(BuildContext context) {
    var statusParams = _availabilityStatusText();
    return Container(
        decoration: BoxDecoration(color: statusParams.backgroundColor),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              padding: const EdgeInsets.all(100),
              child: Text(
                statusParams.status,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 58,
                    color: Colors.black87,
                    fontFamily: 'Khand',
                    fontWeight: FontWeight.bold),
              )),
          Text(
            'Hello World',
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 32,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Hello World',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 32,
              color: Colors.black87,
            ),
          ),
        ]));
  }

  AvailabilityStatusParams _availabilityStatusText() {
    if (_status == AvailabilityStatus.vacant)
      return Vacant();
    else if (_status == AvailabilityStatus.startsSoon)
      return StartsSoon();
    else
      return Occupied();
  }
}

class Availability extends StatefulWidget {
  @override
  AvailabilityState createState() => AvailabilityState();
}
