import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/note_detail.dart';
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
  FirestoreRepository firestoreRepository = FirestoreRepository();

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
                      builder: (_) =>
                          alertDialog(context, firestoreRepository));
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
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: firestoreRepository.getPublicNotes(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              );
            } else if(snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: textField(searchController, Icon(Icons.search),
                            Color(0x1A008B83), 'Search by title')),
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 50, right: 50),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: 229,
                                child: Card(
                                    elevation: 0,
                                    color: Color(0x99d3edfa),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0)),
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20, left: 30, right: 30),
                                              child: Text('${snapshot.data.docs[index]['title']}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 40, right: 40),
                                              child: GestureDetector(
                                                onTap: () => {navigateToDeatail(snapshot.data.docs[index])},
                                                child:  Center(
                                                  child: Text(
                                                      '${snapshot.data.docs[index]['description'].toString()}',
                                                      textAlign: TextAlign.center,
                                                      maxLines: 3,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w400)),
                                                ),
                                              )

                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Center(
                                                  child: Text('${snapshot.data.docs[index]['user_nickname']}',
                                                      maxLines: 3,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w400)),
                                                ))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Column(
                                              children: [
                                                Icon(Icons.favorite,),
                                                Text('${snapshot.data.docs[index]['like'].toString()}')
                                              ],
                                            ),
                                            SizedBox(width: 200,),
                                            Column(
                                              children: [
                                                Icon(Icons.cancel_outlined, ),
                                                Text('${snapshot.data.docs[index]['dislike'].toString()}')
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    )));
                          }),
                    ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        )
        );
  }

  navigateToDeatail(QueryDocumentSnapshot doc) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteDetail(snapshot: doc)));
  }
}
