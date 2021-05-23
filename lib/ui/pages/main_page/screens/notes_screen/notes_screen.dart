import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/widgets/alert_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main_page.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotesScreenState();
  }
}

class NotesScreenState extends State<NotesScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black87,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => alertDialog(context, firestoreRepository));
              }),
          IconButton(
              icon: Icon(
                Icons.filter_alt_sharp,
                color: Colors.black87,
              ),
              onPressed: () {})
        ],
        backgroundColor: Colors.white38,
        elevation: 0,
        title: Text(
          'Notes feed',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                child: textField(searchController, Icon(Icons.search),
                    Color(0x1A008B83), 'Search by title')),

          ],
        ),
      )
    );
  }
}
