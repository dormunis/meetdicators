import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class BookMeeting extends StatefulWidget {
  BookMeeting({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BookMeetingState createState() => _BookMeetingState();
}

class _BookMeetingState extends State<BookMeeting> {
  static String _sliderLabelFormat = "HH:mm";
  static double _startingNewMeetingDurationInMinutes = 30.0;
  static double _minimumMeetingTimeInMinutes = 15.0;
  static double _maximumMeetingTimeInMinutes = 90.0;
  static int _snap = 15;
  static double _sliderDivisions =
      _maximumMeetingTimeInMinutes / _minimumMeetingTimeInMinutes;

  double _sliderValue = _startingNewMeetingDurationInMinutes.roundToDouble();
  String _sliderLabel = "";

  void _setSliderLabel(double value) {
    int minutes = (value % 60).floor();
    if (value >= 60) {
      int hours = (value / 60).floor();
      _sliderLabel = "${hours}h${minutes}m";
    } else {
      _sliderLabel = "${minutes}m";
    }
  }

  double _snapValue(double newValue) {
    if (newValue < _minimumMeetingTimeInMinutes) {
      return _minimumMeetingTimeInMinutes;
    }
    return (newValue / _snap).floor() * _snap.roundToDouble();
  }

  List<Widget> _createHatching() {
    List<Widget> hatching = new List(_sliderDivisions.round() + 1);
    DateTime now = DateTime.now();
    for (int i = 0; i <= _sliderDivisions.round(); i++) {
      DateTime currentDateTime = now;
      if (i != 0) {
        currentDateTime = _snapDateTime(now.add(Duration(minutes: i * _snap)));
      }
      String formattedDateTime =
          DateFormat(_sliderLabelFormat).format(currentDateTime);
      hatching[i] = Expanded(
        child: SizedBox(
          child: Text(formattedDateTime,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: _shouldBoldenHatching(i)
                      ? FontWeight.bold
                      : FontWeight.normal)),
        ),
      );
    }
    return hatching;
  }

  bool _shouldBoldenHatching(int index) {
    return index == 0 || index == _sliderValue / _snap;
  }

  DateTime _snapDateTime(DateTime datetime) {
    Duration timeToAdd;
    if (datetime.minute < 10) {
      timeToAdd = Duration(minutes: 15 - datetime.minute);
    } else if (datetime.minute < 25) {
      timeToAdd = Duration(minutes: 30 - datetime.minute);
    } else if (datetime.minute < 40) {
      timeToAdd = Duration(minutes: 45 - datetime.minute);
    } else if (datetime.minute < 55) {
      timeToAdd = Duration(minutes: 60 - datetime.minute);
    } else if (datetime.minute < 60) {
      timeToAdd = Duration(hours: 1, minutes: 15 - (60 - datetime.minute));
    }
    return datetime.add(timeToAdd);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: Slider(
                activeColor: Colors.indigoAccent,
                min: 0.0,
                max: _maximumMeetingTimeInMinutes,
                divisions: _sliderDivisions.floor(),
                label: "$_sliderLabel",
                onChanged: (newValue) {
                  setState(() {
                    double snappedValue = _snapValue(newValue);
                    _sliderValue = snappedValue;
                    _setSliderLabel(snappedValue);
                  });
                },
                value: _sliderValue,
              ),
            ),
          ),
        ],
      ),
      Row(
        children: _createHatching(),
      )
    ]);
  }
}
