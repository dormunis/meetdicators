import 'dart:convert';

import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter/services.dart';

final int _maxEventResults = 5;

const _SCOPES = const [
  CalendarApi.CalendarScope,
  CalendarApi.CalendarEventsScope,
];

Future<Object> _upcomingEvents(httpClient, room, limit, start, end) async {
  var calendar = new CalendarApi(httpClient);
  return calendar.events.list(
    room,
    maxResults: limit,
    timeZone: "UTC",
    singleEvents: true,
    orderBy: "startTime",
    timeMin: start,
    timeMax: end,
  );
}

Future<Object> _postEvent(
    httpClient, String room, DateTime start, DateTime end) async {
  var calendar = new CalendarApi(httpClient);
  Event event = Event.fromJson({
    "end": {"dateTime": end.toUtc().toIso8601String(), "timeZone": "UTC"},
    "start": {"dateTime": start.toUtc().toIso8601String(), "timeZone": "UTC"},
    "summary": "Manually set meeting"
  });
  return calendar.events.insert(event, room);
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
  final _calendarIds =
      json.decode(await _readAsset('assets/google/calendar-ids.json'));
  final _credentialsContents =
      json.decode(await _readAsset('assets/google/.service-account.json'));
  final _credentials =
      new ServiceAccountCredentials.fromJson(_credentialsContents);
  var httpClient = await clientViaServiceAccount(_credentials, _SCOPES);
  final DateTime now = DateTime.now().toUtc();
  final DateTime tomorrow = DateTime(now.year, now.month, now.day + 5).toUtc();
  var rawEvents = await _upcomingEvents(
      httpClient, _calendarIds[room], _maxEventResults, now, tomorrow);
  return await _parseEvents(rawEvents);
}

Future<void> pushMeeting(
    String room, DateTime startTime, DateTime endTime) async {
  final _calendarIds =
      json.decode(await _readAsset('assets/google/calendar-ids.json'));
  final _credentialsContents =
      json.decode(await _readAsset('assets/google/.service-account.json'));
  final _credentials =
      new ServiceAccountCredentials.fromJson(_credentialsContents);
  var httpClient = await clientViaServiceAccount(_credentials, _SCOPES);
  var res =
      await _postEvent(httpClient, _calendarIds[room], startTime, endTime);
  print('test');
}

Future<void> main() async {
  List events = await getCalendarEvents('einstein');
  print(events);
}
