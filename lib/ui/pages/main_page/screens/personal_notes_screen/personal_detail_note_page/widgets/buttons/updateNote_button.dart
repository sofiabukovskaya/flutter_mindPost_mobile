import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

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
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.teal[200]
        ),
        child: const Icon(Icons.edit),
        onPressed: () {
          showDialog<dynamic>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title:  Text(AppLocalizations.of(context)
                      .translate('change_info_string')),
                  content: Form(
                      child: Container(
                    height: 150,
                    width: 150,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: controllerTextTitle,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)
                                .translate('title_string'),
                            hintText: '$title',
                          ),
                          onSaved: (String artistValue) {},
                        ),
                        TextFormField(
                          controller: controllerTextDescription,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)
                                .translate('description_string'),
                            hintText: '$description',
                          ),
                          onSaved: (String artistValue) {},
                        ),
                      ],
                    ),
                  )),
                  actions: <TextButton>[
                    TextButton(
                        child:  Text(AppLocalizations.of(context)
                            .translate('no_string')),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        }),
                    TextButton(
                        child: Text(AppLocalizations.of(context)
                            .translate('yes_string')),
                        onPressed: onClickedYesButton),
                  ],
                );
              });
        },
      ),
    );
  }
}
