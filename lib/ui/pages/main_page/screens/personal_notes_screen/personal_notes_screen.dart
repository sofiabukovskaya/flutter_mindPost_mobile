import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/main_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/widgets/alert_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalNotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalNotesScreenState();
  }
}

class PersonalNotesScreenState extends State<PersonalNotesScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
    actions: [
    IconButton(
    icon: Icon(
      Icons.logout,
      color: Colors.black87,
    ),
    onPressed: () {
    showDialog(
    context: context,
    builder: (_) =>
    alertDialog(context, firestoreRepository));
    }),  IconButton(
          icon: Icon(
            Icons.filter_alt_sharp,
            color: Colors.black87,
          ),
          onPressed: () {
          })
    ],
    backgroundColor: Colors.white38,
    elevation: 0,
    title: Text(
    'Personal notes',
    style: TextStyle(color: Colors.black87),
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
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 150,
                        width: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(
                            children: [
                              Center(
                                child: Container(
                                  height: 100,
                                  width: 132,
                                  child: Image.asset('assets/giraffe.png'),
                                ),
                              ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10, left: 15),
                                    child: Column(
                                      children: [
                                        Text('05/01/21',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400)),
                                        Text('Title',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)),
                                     Text('ddd ',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                  ),
                            ],
                          ),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
