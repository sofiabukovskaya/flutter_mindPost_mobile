import 'package:bloc/bloc.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_detail_bloc/personal_note_detail_event.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_detail_bloc/personal_note_detail_state.dart';

class PersonalNoteDetailBloc extends Bloc<PersonalNoteDetailEvent, PersonalNoteDetailState>{
  PersonalNoteDetailBloc() : super(EmptyState());

  @override
  Stream<PersonalNoteDetailState> mapEventToState(PersonalNoteDetailEvent event) async*{
    if(event is UpdatePersonalNoteEvent){
      final String titleNote = event.titleNote;
      final String descriptionNote = event.descriptionNote;
      final String noteId = event.noteId;
      try{
        await FirestoreRepositoryImpl().updateNote(noteId, titleNote, descriptionNote);
        if(titleNote.isEmpty || descriptionNote.isEmpty){
          yield FailEditPersonalNoteState();
        }
        yield SuccessfulEditPersonalNoteState();
      }catch(_){
        yield FailEditPersonalNoteState();
      }
    } if(event is DeletePersonalNoteEvent){
      final String noteId = event.noteId;
      try{
        await FirestoreRepositoryImpl().deleteNote(noteId);
        yield DeletedPersonalNoteState();
      }catch(_){
          yield FailPersonalNoteState();
      }
    }
  }
}