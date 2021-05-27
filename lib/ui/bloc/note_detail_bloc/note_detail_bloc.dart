import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/services/checkInternet_service.dart';
import 'package:flutter_mindpost/ui/bloc/note_detail_bloc/note_detail_event.dart';
import 'package:flutter_mindpost/ui/bloc/note_detail_bloc/note_detail_state.dart';
import 'package:flutter_mindpost/ui/pages/main_page/main_page.dart';

class NoteDetailBlock extends Bloc<NoteDetailEvent, NoteDetailState> {
  NoteDetailBlock({@required FirestoreRepository firestoreRepository})
      : super(EmptyState());

  @override
  Stream<NoteDetailState> mapEventToState(NoteDetailEvent event) async* {
    if (event is DislikeEvent) {
      yield LoadingState();
      try {
        final String noteId = event.noteId;
        final int dislike = event.dislike;
        await firestoreRepository.updateDislikeCount(noteId, dislike);
        yield DislikingIsSuccessfulState();
      } catch (_) {
        yield NoInternetConnectionState();
      }
    }
    if (event is LikeEvent) {
      yield LoadingState();
      try {
        yield LikingIsSuccessfulState();
      } catch (_) {
        yield NoInternetConnectionState();
      }
    }
    if (event is CheckInternetConnectionEvent) {
      yield  LoadingState();
      try {
        CheckInternetConnection().check().then<dynamic>((bool internet) async* {
          if (internet != null && internet) {
            yield LoadingState();
          }
          yield NoInternetConnectionState();
        });
      } catch (_) {}
    }
  }
}
