import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_bloc/personal_note_event.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_bloc/personal_note_state.dart';

class PersonalNotesBloc extends Bloc<PersonalNotesEvent, PersonalNotesState> {

  PersonalNotesBloc() : super(LoadedPersonalNotesState(loadedNotesList: FirestoreRepositoryImpl().getPrivateNotes()));

  @override
  Stream<PersonalNotesState> mapEventToState(PersonalNotesEvent event) async* {
    if(event is LoadingNotesEvent) {
      yield LoadingPersonalNotesState();
      try{
        final Stream<QuerySnapshot<Map<String, dynamic>>> loadedNotes = FirestoreRepositoryImpl().getPrivateNotes();
        yield LoadedPersonalNotesState(loadedNotesList: loadedNotes);
        if(loadedNotes.isEmpty == null) {
          yield NoDataNotesState();
        }
      } catch(_){
          yield ErrorInternetConnectionState();
      }
    } if(event is AddNoteEvent) {
        yield AddedNoteButtonPressedState();
    } if(event is PersonalNotesOrderBy){
      final bool publicOrNot = event.public;
      final Stream<QuerySnapshot<Map<String, dynamic>>> loadedFilteredNotes = FirestoreRepositoryImpl().getFilteredPrivateNotes(publicOrNot);
      yield LoadedPersonalNotesState(loadedNotesList: loadedFilteredNotes);
    } if(event is PersonalNotesSearchEvent){
      final String query = event.userQuerySearch;
      try{
        final Stream<QuerySnapshot<Map<String, dynamic>>> loadedSearchNotes = FirestoreRepositoryImpl().getSearchPrivateNotes(query);
        if(loadedSearchNotes.isEmpty != null) {
          yield NoSearchingPersonalNoteState();
        }
        yield LoadedPersonalNotesState(loadedNotesList: loadedSearchNotes);
      } catch(_) {
       yield ErrorInternetConnectionState();
      }
    }
  }

}