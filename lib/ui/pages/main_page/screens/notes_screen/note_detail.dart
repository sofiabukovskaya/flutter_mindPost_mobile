

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteDetail extends StatefulWidget{
  final QueryDocumentSnapshot snapshot;

  const NoteDetail({Key key, this.snapshot}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return NoteDetailState();
  }

}

class NoteDetailState extends State<NoteDetail>{
  final CollectionReference collectionReferenceNotes =
  FirebaseFirestore.instance.collection('notes');

  String title = '';
  String description = '';
  int like;
  int dislike;
  bool clickedLike = false;
  bool clickedDislike = false;
  @override
  void initState() {
    super.initState();
    title = widget.snapshot.get('title').toString();
    description = widget.snapshot.get('description').toString();
    like = widget.snapshot.get('like');
    dislike = widget.snapshot.get('dislike');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white38,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: ListTile(
                title: Text(
                  '$title',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '${widget.snapshot.get('publish').toString()}',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: ListTile(
                leading: Text(
                  '$description',
                  maxLines: 3,
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 150),
                      child: IconButton(icon: Icon(Icons.favorite), onPressed: clickedLike ? null :() {
                        setState(() {
                          like++;
                          collectionReferenceNotes
                              .doc('${widget.snapshot.id}').update({
                            'like' : like
                          });
                          clickedLike = true;
                          clickedDislike = true;
                          _showToast(context);
                        });
                      },),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10, left: 150),
                    child: Text('$like'),)
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 10),
                      child: IconButton(icon: Icon(Icons.cancel_outlined), onPressed: clickedDislike ? null :() {
                        setState(() {
                          dislike++;
                          collectionReferenceNotes
                              .doc('${widget.snapshot.id}').update({
                            'dislike' : dislike
                          });
                          clickedDislike = true;
                          clickedLike = true;
                          _showToastDislike(context);
                        });
                      },),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10),
                      child: Text('$dislike'),)
                  ],
                )
              ],
            )

          ],
        ),
      ),
    );
  }
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('You like this note'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showToastDislike(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('You dislike this note'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}