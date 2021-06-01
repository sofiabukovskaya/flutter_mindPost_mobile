class PersonalNotesEvent{}

class LoadingNotesEvent extends PersonalNotesEvent{


}
class AddNoteEvent extends PersonalNotesEvent {}

class PersonalNotesOrderBy extends PersonalNotesEvent{
  PersonalNotesOrderBy(this.public);
  final bool public;
}

class PersonalNotesSearchEvent extends PersonalNotesEvent{
  PersonalNotesSearchEvent(this.userQuerySearch);
  final String userQuerySearch;
}