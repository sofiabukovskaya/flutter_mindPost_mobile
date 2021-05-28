import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/widgets/buttons/deleteNote_button.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/widgets/description_text.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/widgets/title_datePublich_text.dart';
import 'widgets/buttons/updateNote_button.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({Key key, this.snapshot}) : super(key: key);
  final QueryDocumentSnapshot<dynamic> snapshot;

  @override
  State<StatefulWidget> createState() {
    return PersonalDetailState();
  }
}

class PersonalDetailState extends State<PersonalDetail> {
  TextEditingController controllerTextTitle = TextEditingController();
  TextEditingController controllerTextDescription = TextEditingController();

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
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            titleAndDatePublishText(title, widget.snapshot),
            descriptionText(description),
             SizedBox(
               width: 128,
              child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    UpdateNoteButton(
                      controllerTextDescription: controllerTextDescription,
                      controllerTextTitle: controllerTextTitle,
                      description: description,
                      snapshot: widget.snapshot,
                      title: title,
                      onClickedYesButton: updateNote,
                    ),
                    DeleteNoteButton(onClickedYesButton: deleteNote)
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteNote() {
    FirestoreRepositoryImpl().deleteNote(widget.snapshot.id).then((dynamic value) =>
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Note delete'))));
    Navigator.pushNamed(context, '/goBackAfterDeleteNote');
  }

  void updateNote() {
    setState(() {
      title = controllerTextTitle.text;
      description = controllerTextDescription.text;
    });
    FirestoreRepositoryImpl()
        .updateNote(widget.snapshot.id, controllerTextTitle.text,
            controllerTextDescription.text)
        .then((dynamic value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text("Update ${widget.snapshot.get('title').toString()}"))));
    Navigator.of(context).pop(true);
  }
}
