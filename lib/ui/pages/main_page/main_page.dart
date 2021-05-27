import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/calendar_screen/calendar_screen.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/notes_screen.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_notes_screen.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/profile_screen/profile_screen.dart';
import 'package:flutter_mindpost/ui/pages/main_page/widgets/alert_dialog.dart';
import 'package:flutter_mindpost/ui/pages/main_page/widgets/tab_bar.dart';


class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            ProfileScreen(),
            NotesScreen(),
            PersonalNotesScreen(),
            CalendarScreen()
          ],
        ),
        bottomNavigationBar: tabBar(),
      ),
    );
  }
}
