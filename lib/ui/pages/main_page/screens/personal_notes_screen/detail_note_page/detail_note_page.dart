
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_notes_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailNotePage extends StatefulWidget {
  final QueryDocumentSnapshot snapshot;

  const DetailNotePage({Key key, this.snapshot}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailNotePageState();
  }
}

class DetailNotePageState extends State<DetailNotePage> {
  TextEditingController controller_text = TextEditingController();
  TextEditingController controller_desc = TextEditingController();
  final CollectionReference collectionReferenceNotes =
      FirebaseFirestore.instance.collection('notes');

  String title = '';
  String description = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.snapshot.get('title').toString();
    description = widget.snapshot.get('description').toString();
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
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FlatButton(
                color: Colors.teal[200],
                child: Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Change info'),
                          content: Form(
                              child: Column(
                            children: [
                              TextFormField(
                                controller: controller_text,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  labelText: 'Title:',
                                  hintText: '$title',
                                ),
                                onSaved: (String artistValue) {},
                              ),
                              TextFormField(
                                controller: controller_desc,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  labelText: 'Description:',
                                  hintText: '$description',
                                ),
                                onSaved: (String artistValue) {},
                              ),
                            ],
                          )),
                          actions: [
                            FlatButton(
                                child: Text('NO'),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                }),
                            FlatButton(
                                child: Text('YES'),
                                onPressed: () {
                                  setState(() {
                                    title = controller_text.text;
                                    description = controller_desc.text;
                                  });
                                  collectionReferenceNotes
                                      .doc('${widget.snapshot.id}')
                                      .update({
                                    'title': controller_text.text.isNotEmpty
                                        ? controller_text.text
                                        : title,
                                    'description': controller_desc.text == ''
                                        ? controller_desc.text
                                        : description
                                  }).then((value) => Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Update ${widget.snapshot.get('title').toString()}"))));
                                  Navigator.of(context).pop(true);
                                }),
                          ],
                        );
                      });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FlatButton(
                color: Colors.red[400],
                child: Icon(Icons.delete),
                onPressed: () {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('Delete a note'),
                      actions: [
                        FlatButton(
                            child: Text('NO'),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            }),
                        FlatButton(
                            child: Text('YES'),
                            onPressed: () {
                              collectionReferenceNotes
                                  .doc('${widget.snapshot.id}').delete().then((value) => Scaffold.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                      "Note delete"))) );
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> PersonalNotesScreen()));
                            }),
                      ],
                    );
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
