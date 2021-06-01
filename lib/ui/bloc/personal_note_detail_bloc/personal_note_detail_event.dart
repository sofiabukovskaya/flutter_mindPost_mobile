class PersonalNoteDetailEvent{}

class DeletePersonalNoteEvent extends PersonalNoteDetailEvent{
  DeletePersonalNoteEvent(this.noteId);
  final String noteId;
}

class UpdatePersonalNoteEvent extends PersonalNoteDetailEvent{
  UpdatePersonalNoteEvent(this.noteId, this.titleNote, this.descriptionNote);
  final String noteId;
  final String titleNote;
  final String descriptionNote;

}