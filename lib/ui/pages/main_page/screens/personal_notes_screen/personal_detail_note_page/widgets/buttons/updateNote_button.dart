import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateNoteButton extends StatelessWidget {
  const UpdateNoteButton(
      {Key key,
      @required this.controllerTextDescription,
      @required this.controllerTextTitle,
      @required this.description,
      @required this.snapshot,
      @required this.title,
      this.onClickedYesButton})
      : super(key: key);

  final TextEditingController controllerTextDescription;
  final TextEditingController controllerTextTitle;
  final String description;
  final QueryDocumentSnapshot<dynamic> snapshot;
  final String title;
  final VoidCallback onClickedYesButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        onPressed: onClickedYesButton),
                  ],
                );
              });
        },
      ),
    );
  }
}
