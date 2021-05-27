import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_notes_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetailNotePage extends StatefulWidget {
  const PersonalDetailNotePage({Key key, this.snapshot}) : super(key: key);
  final QueryDocumentSnapshot<dynamic> snapshot;

  @override
  State<StatefulWidget> createState() {
    return PersonalDetailNotePageState();
  }
}

class PersonalDetailNotePageState extends State<PersonalDetailNotePage> {
  TextEditingController controllerTextTitle = TextEditingController();
  TextEditingController controllerTextDescription = TextEditingController();
  final CollectionReference<dynamic> collectionReferenceNotes =
      FirebaseFirestore.instance.collection('notes');

  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    title = widget.snapshot.get('title').toString();
    description = widget.snapshot.get('description').toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white38,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
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
              padding: const EdgeInsets.only(top: 30, left: 20),
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
              padding: const EdgeInsets.only(top: 10),
              child: FlatButton(
                color: Colors.teal[200],
                child: const Icon(Icons.edit),
                onPressed: () {
                  showDialog<dynamic>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Change info'),
                          content: Form(
                              child: Container(
                            height: 150,
                            width: 150,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controllerTextTitle,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelText: 'Title:',
                                    hintText: '$title',
                                  ),
                                  onSaved: (String artistValue) {},
                                ),
                                TextFormField(
                                  controller: controllerTextDescription,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelText: 'Description:',
                                    hintText: '$description',
                                  ),
                                  onSaved: (String artistValue) {},
                                ),
                              ],
                            ),
                          )),
                          actions: [
                            FlatButton(
                                child: const Text('NO'),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                }),
                            FlatButton(
                                child: const Text('YES'),
                                onPressed: () {
                                  setState(() {
                                    title = controllerTextTitle.text;
                                    description =
                                        controllerTextDescription.text;
                                  });
                                  collectionReferenceNotes
                                      .doc('${widget.snapshot.id}')
                                      .update({
                                    'title': controllerTextTitle.text.isNotEmpty
                                        ? controllerTextTitle.text
                                        : title,
                                    'description':
                                        controllerTextDescription.text == ''
                                            ? controllerTextDescription.text
                                            : description
                                  }).then((dynamic value) => Scaffold.of(
                                              context)
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
              padding: const EdgeInsets.only(top: 10),
              child: FlatButton(
                color: Colors.red[400],
                child: const Icon(Icons.delete),
                onPressed: () {
                  showDialog<dynamic>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete a note'),
                          actions: [
                            FlatButton(
                                child: const Text('NO'),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                }),
                            FlatButton(
                                child: const Text('YES'),
                                onPressed: () {
                                  collectionReferenceNotes
                                      .doc('${widget.snapshot.id}')
                                      .delete()
                                      .then((dynamic value) =>
                                          Scaffold.of(context).showSnackBar(
                                              const SnackBar(
                                                  content:
                                                      Text('Note delete'))));
                                  Navigator.push<dynamic>(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) =>
                                              PersonalNotesScreen()));
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
