import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PersonalNotesState {}

class LoadingPersonalNotesState extends PersonalNotesState {
}

class LoadedPersonalNotesState extends PersonalNotesState {
  LoadedPersonalNotesState({@required this.loadedNotesList});

  final Stream<QuerySnapshot<Map<String, dynamic>>>  loadedNotesList;
}

class AddedNoteButtonPressedState extends PersonalNotesState {}

class NoDataNotesState extends PersonalNotesState {}

class ErrorInternetConnectionState extends PersonalNotesState {}
