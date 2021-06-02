import 'package:flutter_mindpost/data/models/event.dart';

class CalendarEvent{}

class AddCalendarDataEvent extends CalendarEvent{
  AddCalendarDataEvent(this.selectedEvents, this.selectedDay, this.eventController);
  final Map<DateTime, List<Event>> selectedEvents;
  final DateTime selectedDay;
  final String eventController;
}
class ShareGoogleCalendarDataEvent extends CalendarEvent{
  ShareGoogleCalendarDataEvent(this.eventTitle, this.timeStart, this.timeEnd);
  final String eventTitle;
  final DateTime timeStart;
  final DateTime timeEnd;

}
class DeleteCalendarDataEvent extends CalendarEvent{
  DeleteCalendarDataEvent(this.selectedEvents, this.selectedDay, this.printTime);
  final Map<DateTime, List<Event>> selectedEvents;
  final DateTime selectedDay;
 final String printTime;


}
class AddTimeCalendarDataEvent extends CalendarEvent{}