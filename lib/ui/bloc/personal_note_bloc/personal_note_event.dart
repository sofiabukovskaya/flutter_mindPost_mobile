class PersonalNotesEvent{}

class LoadingNotesEvent extends PersonalNotesEvent{
  LoadingNotesEvent(this.public);
  final bool public;
}
class AddNoteEvent extends PersonalNotesEvent {}

class PersonalNotesOrderBy extends PersonalNotesEvent{
  PersonalNotesOrderBy(this.public);
  final bool public;
}