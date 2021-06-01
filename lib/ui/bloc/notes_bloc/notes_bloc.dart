
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/bloc/notes_bloc/notes_event.dart';
import 'package:flutter_mindpost/ui/bloc/notes_bloc/notes_state.dart';

class PublicNotesBloc extends Bloc<NotesEvent, NotesState>{
  PublicNotesBloc() : super(LoadedPublicNotesState(loadedPublicNotesList: FirestoreRepositoryImpl().getPublicNotes()));

  @override
  Stream<NotesState> mapEventToState(NotesEvent event) async*{
    if(event is PublicNotesOrderByEvent) {
      final String orderByQuery = event.orderByQuery;
      try{
        yield LoadingPublicNotesState();
        final Stream<QuerySnapshot<Map<String, dynamic>>> publicNotesOrdered = FirestoreRepositoryImpl().getFilteredPublicNotes(orderByQuery);
        yield LoadedPublicNotesState(loadedPublicNotesList: publicNotesOrdered);
      } catch(_){
        yield NoPublicNotesState();
      }
    }
  }
}