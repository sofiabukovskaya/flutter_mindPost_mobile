import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mindpost/ui/pages/main_page/main_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/widgets/alert_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'detail_note_page/detail_note_page.dart';

class PersonalNotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalNotesScreenState();
  }
}

class PersonalNotesScreenState extends State<PersonalNotesScreen> {
  TextEditingController searchController = TextEditingController();
  FirestoreRepository firestoreRepository = FirestoreRepository();
  bool public;
  String token = '';
  dynamic fire;

  @override
  void initState() {
    super.initState();
    getId();
  }

  Future<dynamic> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token') ?? '';
      fire = FirebaseFirestore.instance
          .collection('notes')
          .where('userId', isEqualTo: token)
          .snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black87,
                ),
                onPressed: () {
                  showDialog<dynamic>(
                      context: context,
                      builder: (_) =>
                          alertDialog(context, firestoreRepository));
                }),
            IconButton(
                icon: const Icon(
                  Icons.filter_alt_sharp,
                  color: Colors.black87,
                ),
                onPressed: () {})
          ],
          backgroundColor: Colors.white38,
          elevation: 0,
          title: titleAppBar('Personal notes'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 45.0,
          ),
          backgroundColor: const Color(0xFF157C76),
          onPressed: () {
            Navigator.pushNamed(context, '/addNote');
          },
        ),
        body: StreamBuilder<QuerySnapshot<Object>>(
          stream: fire,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: Text('You have not notes, press plus button to add'));
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: textField(searchController, const Icon(Icons.search),
                            const Color(0x1A008B83), 'Search by title')),
                    Padding(
                      padding:const  EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            public = snapshot.data.docs[index]['public'];
                            return Container(
                                height: 150,
                                width: 100,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 20,
                                          child: Padding(
                                              padding:
                                              const EdgeInsets.only(left: 10),
                                              child: Container(
                                                height: 100,
                                                width: 132,
                                                child: Image.asset(
                                                    'assets/giraffe.png'),
                                              ))),
                                      Positioned(
                                        top: 20,
                                        left: 150,
                                        child: Text(
                                            '${snapshot.data.docs[index]['publish'].toString()}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      Positioned(
                                        top: 46,
                                        left: 150,
                                        child: Text(
                                            '${snapshot.data.docs[index]['title']}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Positioned(
                                          top: 70,
                                          left: 150,
                                          child: GestureDetector(
                                            onTap: () => navigateToDeatail(snapshot.data.docs[index]),
                                            child:Container(
                                                height: 150,
                                                width: 200,
                                                child: Text(
                                                    '${snapshot.data.docs[index]['description'].toString()}',
                                                    maxLines: 2,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.w400))) ,
                                          )
                                          ),
                                      Positioned(
                                          top: 50,
                                          left: 300,
                                          child: public == true
                                              ? const Icon(
                                                  Icons.lock_open,
                                                  color: Colors.black38,
                                                )
                                              : const Icon(
                                                  Icons.lock_outline,
                                                  color: Colors.black38,
                                                ))
                                    ],
                                  ),
                                ));
                          }),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            );
          },
        ));
  }

  dynamic navigateToDeatail(QueryDocumentSnapshot<Object> doc) {
    Navigator.push<dynamic>(context, MaterialPageRoute<dynamic>(builder: (BuildContext context)=> DetailNotePage(snapshot: doc)));
  }
}
