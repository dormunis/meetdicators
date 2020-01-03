import 'dart:convert';

import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'dart:io';

final int _maxEventResults = 5;

final _calendarIds = json.decode(new File('calendar-ids.json').readAsStringSync());

final _credentials = new ServiceAccountCredentials.fromJson(
    new File('.service-account.json').readAsStringSync());

const _SCOPES = const [
  CalendarApi.CalendarEventsReadonlyScope,
  CalendarApi.CalendarEventsScope,
  CalendarApi.CalendarReadonlyScope,
  CalendarApi.CalendarScope,
  CalendarApi.CalendarSettingsReadonlyScope,
];

void main() {
  clientViaServiceAccount(_credentials, _SCOPES).then((httpClient) {
    var calendar = new CalendarApi(httpClient);
    final DateTime now = DateTime.now().toUtc();
    final DateTime tomorrow =
        DateTime(now.year, now.month, now.day + 1).toUtc();
    calendar.events
        .list(_calendarIds['einstein'],
            maxResults: _maxEventResults,
            timeZone: "UTC",
            singleEvents: true,
            orderBy: "startTime",
            timeMin: now,
//            timeMax: tomorrow
    )
        .then((events) {
      for (var event in events.items) {
        print(event.summary);
        print(
            '${event.start.dateTime.toLocal().toString()} - ${event.end.dateTime.toLocal().toString()}');
        print('attendees:');
        for (var attendee in event.attendees) {
          if (!attendee.email.endsWith('resource.calendar.google.com') && !attendee.responseStatus.contains('declined')) {
            print('\t${attendee.email}');
          }
        }
      }
    });
  });
}
