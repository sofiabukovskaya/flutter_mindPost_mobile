import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/bloc/add_note_bloc/add_note_event.dart';
import 'package:flutter_mindpost/ui/bloc/add_note_bloc/add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState>{
  AddNoteBloc() : super(EmptyState());

  @override
  Stream<AddNoteState> mapEventToState(AddNoteEvent event) async*{
      if(event is AddNoteTextEvent) {
        final String titleNote = event.titleNote;
        final String descriptionNote = event.descriptionNote;
        final String uploadedFileUrl = event.uploadedFileUrl;
        final bool switched = event.switched;
        final String dateFormat = event.dateFormat;
        try{
          if(titleNote.isEmpty || descriptionNote.isEmpty) {
            yield FailAddNoteState();
          }
          await FirestoreRepositoryImpl().addDataNote(titleNote, descriptionNote, uploadedFileUrl, switched, dateFormat);
          yield SuccessfulAddNoteState();
        } catch(_){
          yield FailAddNoteState();
        }
      } if(event is UploadImageEvent){
        final File image = event.image;
        final String uploadedFileUrl = event.uploadedFileUrl;
        try{
          await FirestoreRepositoryImpl().uploadImage(image, uploadedFileUrl);
          yield SuccessfulAddNoteState();
        } catch(_){
          yield FailAddNoteState();
        }
      } if( event is ChangeLockIconEvent){
        yield ChangeLockIconState(event.selectedItem);
      }
  }

}