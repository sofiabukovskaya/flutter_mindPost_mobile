class NoteDetailEvent{}

class DislikeEvent extends NoteDetailEvent {
   DislikeEvent(this.noteId, this.dislike);

  final String noteId;
  final int dislike;
}

class LikeEvent extends NoteDetailEvent {
   LikeEvent(this.noteId, this.like);

  final String noteId;
  final int like;
}

class CheckInternetConnectionEvent extends NoteDetailEvent {}
