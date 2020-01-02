import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:occupied_room/next_meetings.dart';
import 'availability_status_params.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return Container(
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Availability());
  }
}

enum AvailabilityStatus { vacant, startsSoon, occupied }

class AvailabilityState extends State<Availability> {
  AvailabilityStatus _status = AvailabilityStatus.occupied;

  void _buttonChange() {

  }

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
                style: statusParams.textStyle
              )),
          statusParams.getAction(),
          NextMeetingsWidget(),
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
