import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mindpost/data/models/event.dart';
import 'package:flutter_mindpost/services/api/calendar_service.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/calendar_screen/widgets/alert_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalendarScreenState();
  }
}

class CalendarScreenState extends State<CalendarScreen> {
  Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String printTime;
  final TextEditingController _eventController = TextEditingController();

  CalendarService calendarService = CalendarService();

  @override
  void initState() {
    selectedEvents = <DateTime, List<Event>>{};
    super.initState();
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
    setState(() {
      time = pickedTime;
      printTime = time.format(context);
    });
  }

  List<Event> getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? <Event>[];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white38,
        elevation: 0,
      ),
      body: ListView(
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
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                  print(focusedDay);
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                eventLoader: getEventsFromDay,
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.teal[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration(
                    color: const Color(0xFF00847c),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  formatButtonTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ...getEventsFromDay(selectedDay).map((Event event) =>
                  ListTile(
                    onLongPress: () {
                      showDialog<dynamic>(
                          context: context,
                          builder: (_) =>
                              alertDialog(() {
                                setState(() {
                                  selectedEvents.remove(selectedDay);
                                  printTime = '';
                                  Navigator.pop(context);
                                });
                              }, calendarService, event, time ));
                    },
                    subtitle: Text(
                      '$printTime',
                      style: textStyle(14.0, FontWeight.w400, Colors.black87),
                    ),
                    title: Text(
                      event.title,
                      style: textStyle(18.0, FontWeight.w400, Colors.black87)
                    ),
                  )
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF00847c),
        onPressed: () => showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(
              '🤩 Event 🤩 ',
              style: textStyle(22.0, FontWeight.w500, Colors.black45),
            ),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                  style: textStyle(18.0, FontWeight.w600, Colors.red),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text('Ok',
                    style: textStyle(
                        18.0, FontWeight.w400, Colors.blueGrey)),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay].add(
                        Event(title: _eventController.text),
                      );
                    } else {
                      selectedEvents[selectedDay] = <Event>[
                        Event(title: _eventController.text)
                      ];
                    }
                  }
                  Navigator.pop(context);
                  selectTime();
                  _eventController.clear();
                },
              ),
            ],
          ),
        ),
        label: Text('Add Event',
            style:
            textStyle(
                18.0, FontWeight.w500, Colors.white)),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
