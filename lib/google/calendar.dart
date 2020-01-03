import 'dart:convert';

import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter/services.dart';

final int _maxEventResults = 5;

const _SCOPES = const [
  CalendarApi.CalendarEventsReadonlyScope,
  CalendarApi.CalendarEventsScope,
  CalendarApi.CalendarReadonlyScope,
  CalendarApi.CalendarScope,
  CalendarApi.CalendarSettingsReadonlyScope,
];

Future<Object> _upcomingEvents(httpClient, room) async {
  var calendar = new CalendarApi(httpClient);
  final DateTime now = DateTime.now().toUtc();
  final DateTime tomorrow =
  DateTime(now.year, now.month, now.day + 1).toUtc();
  return calendar.events.list(
    room,
    maxResults: _maxEventResults,
    timeZone: "UTC",
    singleEvents: true,
    orderBy: "startTime",
    timeMin: now,
//            timeMax: tomorrow
  );
}

Future<List> _parseEvents(events) async {
  List parsedEvents = List();
  for (var event in events.items) {
    List attendees = List();
    for (var attendee in event.attendees) {
      if (!attendee.email.endsWith('resource.calendar.google.com') &&
          !attendee.responseStatus.contains('declined')) {
        attendees.add(attendee.email);
      }
    }
    parsedEvents.add({
      'title': event.summary,
      'start': event.start.dateTime.toLocal(),
      'end': event.end.dateTime.toLocal(),
      'attendees': attendees,
    });
  }
  return parsedEvents;
}

Future<String> _readAsset(String path) async {
  return rootBundle.loadString(path);
}

Future<List> getCalendarEvents(room) async {
  final _calendarIds = json.decode(await _readAsset('assets/google/calendar-ids.json'));
  final _credentialsContents = json.decode(await _readAsset('assets/google/.service-account.json'));
  final _credentials = new ServiceAccountCredentials.fromJson(_credentialsContents);
  var httpClient = await clientViaServiceAccount(_credentials, _SCOPES);
  var rawEvents = await _upcomingEvents(httpClient, _calendarIds[room]);
  return await _parseEvents(rawEvents);
}

Future getCurrentMeeting(room) async {

}

Future<void> postEvent(String room, DateTime endTime) async {
}


Future<void> main() async {
  List events = await getCalendarEvents('einstein');
  print(events);
}
