import 'package:bloc/bloc.dart';
import 'package:flutter_mindpost/data/models/event.dart';
import 'package:flutter_mindpost/services/api/calendar_service.dart';
import 'package:flutter_mindpost/ui/bloc/calendar_bloc/calendar_event.dart';
import 'package:flutter_mindpost/ui/bloc/calendar_bloc/calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState>{
  CalendarBloc() : super(EmptyState());
  CalendarService calendarService = CalendarService();
  @override
  Stream<CalendarState> mapEventToState(CalendarEvent event)async* {
    if(event is AddCalendarDataEvent){
      final Map<DateTime, List<Event>> selectedEvents = event.selectedEvents;
      final DateTime selectedDay = event.selectedDay;
      final String eventController = event.eventController;
      try{
        if (eventController.isEmpty) {
        } else {
          if (selectedEvents[selectedDay] != null) {
            selectedEvents[selectedDay].add(
              Event(title: eventController),
            );
          } else {
            selectedEvents[selectedDay] = <Event>[
              Event(title: eventController)
            ];
          }
        }
        yield SuccessesCalendarState();
        yield EmptyState();
      }catch(_){
        yield FailCalendarState();
      }
    } if(event is ShareGoogleCalendarDataEvent){
      final String eventTitle = event.eventTitle;
      final DateTime timeStart = event.timeStart;
      final DateTime timeEnd = event.timeEnd;
      try{
         calendarService.insert(eventTitle, timeStart, timeEnd);
         yield SuccessesCalendarState();
         yield EmptyState();
      } catch(_){
        yield FailCalendarState();
      }
    } if(event is DeleteCalendarDataEvent){
      final Map<DateTime, List<Event>> selectedEvents = event.selectedEvents;
      final DateTime selectedDay = event.selectedDay;
      try{
          selectedEvents.remove(selectedDay);
        yield DeletingCalendarDataState();
        yield EmptyState();
      } catch(_){
        yield FailCalendarState();
      }
    }
  }
}