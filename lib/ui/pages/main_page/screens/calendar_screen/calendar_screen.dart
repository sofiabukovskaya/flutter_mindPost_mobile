import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mindpost/data/models/event.dart';
import 'package:google_fonts/google_fonts.dart';
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
  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }
    Future selectTime()async {
      final TimeOfDay pickedTime = await showTimePicker(context: context, initialTime: time, builder: (context, Widget child){
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.teal,
            accentColor: Colors.teal,
            colorScheme: ColorScheme.light( primary:  Colors.teal),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary
            )
          ), child: child,
        );
      });
      setState(() {
        time = pickedTime;
        printTime = time.format(context);
      });
    }
  List<Event> getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
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
        children: [
          Column(
            children: [
              TableCalendar(
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
                  selectedTextStyle: TextStyle(color: Colors.white),
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
                    color: Color(0xFF00847c),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ...getEventsFromDay(selectedDay).map(
                (Event event) =>  ListTile(
                  subtitle: Text(
                    '$printTime',
                      style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                    title: Text(
                      event.title,
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF00847c),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "🤩 Event 🤩 ",
              style: GoogleFonts.poppins(
                  fontSize: 22, fontWeight: FontWeight.w500),
            ),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: Text(
                  "Cancel",
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.red),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok",
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: Colors.blueGrey)),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay].add(
                        Event(title: _eventController.text),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
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
        label: Text("Add Event",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500)),
        icon: Icon(Icons.add),
      ),
    );
  }
}
