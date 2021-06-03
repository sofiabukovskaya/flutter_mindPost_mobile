import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/data/models/event.dart';
import 'package:flutter_mindpost/ui/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/calendar_bloc/calendar_event.dart';
import 'package:flutter_mindpost/ui/bloc/calendar_bloc/calendar_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/calendar_screen/widgets/alert_dialog.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/calendar_screen/widgets/alert_dialog_add_event.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/calendar_screen/widgets/calendar_style.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/calendar_screen/widgets/header_style.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarListState();
}

class _CalendarListState extends State<CalendarList> {
  CalendarBloc calendarBloc;
  Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String printTime;
  final TextEditingController eventController = TextEditingController();


  @override
  void initState() {
    super.initState();
    selectedEvents = <DateTime, List<Event>>{};
    calendarBloc = BlocProvider.of<CalendarBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (BuildContext context, CalendarState state) {
            if(state is FailCalendarState){
              Timer.run(() {
                showSnackBar(context,AppLocalizations.of(context).translate('error_string'));
              });
            } if(state is DeletingCalendarDataState){
              printTime = '';
              Timer.run(() {
                showSnackBar(context, AppLocalizations.of(context).translate('event_delete_string'));
              });
            } if(state is SelectDayCalendarState){
              selectedDay = state.selectDay;
              focusedDay = state.focusDay;
            } if(state is SelectTimeCalendarState) {
              Timer.run(() {
                showSnackBar(context, AppLocalizations.of(context).translate('event_add_string'));
              });
              time = state.pickedTime;
              printTime = time.format(context);
            }
        return ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TableCalendar<Event>(
                    focusedDay: selectedDay,
                    firstDay: DateTime(1990),
                    lastDay: DateTime(2050),
                    calendarFormat: format,
                    onFormatChanged: (CalendarFormat _format) {
                      setState(() {
                        format = _format;
                      });
                    },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    daysOfWeekVisible: true,
                    onDaySelected: (DateTime selectDay, DateTime focusDay) {
                      calendarBloc.add(SelectDayCalendarEvent(selectDay, focusDay));
                    },
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(selectedDay, date);
                    },
                    eventLoader: getEventsFromDay,
                    calendarStyle: calendarStyle(),
                    headerStyle: headerStyle()),
                ...getEventsFromDay(selectedDay).map((Event event) => ListTile(
                      onLongPress: () {
                        showDialog<dynamic>(
                            context: context,
                            builder: (_) => alertDialog(() {
                                    calendarBloc.add(DeleteCalendarDataEvent(selectedEvents, selectedDay, printTime));
                                    Navigator.pop(context);
                                }, () {
                              calendarBloc.add(ShareGoogleCalendarDataEvent(event.title,
                                  DateTime(time.hour, time.minute), DateTime(time.hour, time.minute)));
                            }, event, time));
                      },
                      subtitle: Text(
                        '$printTime',
                        style: textStyle(14.0, FontWeight.w400, Colors.black87),
                      ),
                      title: Text(event.title,
                          style:
                              textStyle(18.0, FontWeight.w400, Colors.black87)),
                    )),
              ],
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF00847c),
        onPressed: () => showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) => alertDialogAddEvent(context, eventController, selectedEvents, selectedDay, selectTime, () {
            calendarBloc.add(AddCalendarDataEvent(selectedEvents, selectedDay, eventController.text));
          })
        ),
        label: Text(AppLocalizations.of(context).translate('add_event_string'),
            style: textStyle(18.0, FontWeight.w500, Colors.white)),
        icon: const Icon(Icons.add),
      ),
    );
  }

  List<Event> getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? <Event>[];
  }

  Future<void> selectTime() async {
    final TimeOfDay pickedTime = await showTimePicker(
        context: context,
        initialTime: time,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
                primaryColor: Colors.teal,
                accentColor: Colors.teal,
                colorScheme: const ColorScheme.light(primary: Colors.teal),
                buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary)),
            child: child,
          );
        });
    calendarBloc.add(AddTimeCalendarDataEvent(pickedTime));
  }
}
