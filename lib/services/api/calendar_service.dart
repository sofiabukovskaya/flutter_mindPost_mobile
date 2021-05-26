import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/calendar/v3.dart' hide Colors;
import 'package:url_launcher/url_launcher.dart';


class CalendarService{
  static const List<String> _scopes = [CalendarApi.calendarScope];

 void insert(String title, DateTime startTime, DateTime endTime) {
    final ClientId _clientID = ClientId('107038544527-grpikigfukfr7hne8bd7gt2ilq88ajqn.apps.googleusercontent.com', '');
    clientViaUserConsent(_clientID, _scopes, prompt).then((AuthClient client) {
      final CalendarApi calendar = CalendarApi(client);
      calendar.calendarList.list().then((CalendarList value) => print('VAL $value'));

      const String calendarId = 'primary';
      final Event event = Event(); // Create object of event

      event.summary = title;

      final EventDateTime start = EventDateTime();
      start.dateTime = startTime;
      start.timeZone = 'GMT+05:00';
      event.start = start;

      final EventDateTime end = EventDateTime();
      end.timeZone = 'GMT+05:00';
      end.dateTime = endTime;
      event.end = end;
      try {
        calendar.events.insert(event, calendarId).then((Event value) {
          print('ADDEDDD ${value.status}');
          if (value.status == 'confirmed') {
            print('Event added in google calendar');
          } else {
            print('Unable to add event in google calendar');
          }
        });
      } catch (e) {
        print('Error creating event $e');
      }
    });
  }

  Future<void> prompt(String url) async {
    print('Please go to the following URL and grant access:');
    print('  => $url');
    print('');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}