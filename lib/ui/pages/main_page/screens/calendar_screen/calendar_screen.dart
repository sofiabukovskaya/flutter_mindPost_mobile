import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_mindpost/ui/bloc/calendar_bloc/calendar_bloc.dart';

import 'package:flutter_mindpost/ui/pages/main_page/screens/calendar_screen/calendar_list.dart';


class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white38,
          elevation: 0,
        ),
        body: BlocProvider<CalendarBloc>(
          create: (BuildContext context) => CalendarBloc(),
          child: CalendarList(),)
    );
  }
}
