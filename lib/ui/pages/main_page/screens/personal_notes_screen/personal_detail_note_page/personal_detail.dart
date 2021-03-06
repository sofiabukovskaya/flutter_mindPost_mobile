import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_detail_bloc/personal_note_detail_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_detail_bloc/personal_note_detail_event.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_detail_bloc/personal_note_detail_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/widgets/buttons/deleteNote_button.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/widgets/description_text.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/widgets/title_datePublich_text.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'widgets/buttons/updateNote_button.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({Key key, this.snapshot}) : super(key: key);
  final QueryDocumentSnapshot<dynamic> snapshot;

  @override
  State<StatefulWidget> createState() {
    return _PersonalDetailState();
  }
}

class _PersonalDetailState extends State<PersonalDetail> {
  TextEditingController controllerTextTitle = TextEditingController();
  TextEditingController controllerTextDescription = TextEditingController();
  PersonalNoteDetailBloc personalNoteDetailBloc;
  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    personalNoteDetailBloc = BlocProvider.of<PersonalNoteDetailBloc>(context);
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
        body: BlocBuilder<PersonalNoteDetailBloc, PersonalNoteDetailState>(
            bloc: personalNoteDetailBloc,
            builder: (BuildContext context, PersonalNoteDetailState state) {
              if (state is DeletedPersonalNoteState) {
                Timer.run(() {
                  showSnackBar(context, AppLocalizations.of(context)
                      .translate('deleting_note_string'));
                });
              }
              if (state is SuccessfulEditPersonalNoteState) {
                  title = controllerTextTitle.text;
                  description = controllerTextDescription.text;
                Timer.run(() {
                  showSnackBar(context, AppLocalizations.of(context)
                      .translate('deleting_note_string'));
                });
                Navigator.of(context).pop(true);
              }
              if (state is FailEditPersonalNoteState) {
                Timer.run(() {
                  showSnackBar(context, AppLocalizations.of(context)
                      .translate('fill_all_note_string'));
                });
              }
              if (state is FailPersonalNoteState) {
                Timer.run(() {
                  showSnackBar(context, AppLocalizations.of(context)
                      .translate('deleting_cannot_note_string'));
                });
              }
              return Container(
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
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            UpdateNoteButton(
                              controllerTextDescription:
                                  controllerTextDescription,
                              controllerTextTitle: controllerTextTitle,
                              description: description,
                              snapshot: widget.snapshot,
                              title: title,
                              onClickedYesButton: updateNote,
                            ),
                            DeleteNoteButton(onClickedYesButton: deleteNote)
                          ]),
                    ),
                  ],
                ),
              );
            }));
  }

  void deleteNote() {
    personalNoteDetailBloc.add(DeletePersonalNoteEvent(widget.snapshot.id));
    Navigator.pushNamed(context, '/goBackAfterDeleteNote');
  }

  void updateNote() {
    personalNoteDetailBloc.add(UpdatePersonalNoteEvent(widget.snapshot.id,
        controllerTextTitle.text, controllerTextDescription.text));
  }
}
