import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class NotesState{}

class LoadingPublicNotesState extends NotesState{}
class LoadedPublicNotesState extends NotesState{
  LoadedPublicNotesState({@required this.loadedPublicNotesList});

  final Stream<QuerySnapshot<Map<String, dynamic>>>  loadedPublicNotesList;
}
class NoPublicNotesState extends NotesState{}
