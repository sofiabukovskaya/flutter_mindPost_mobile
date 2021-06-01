class NotesEvent{}

class PublicNotesOrderByEvent extends NotesEvent{
  PublicNotesOrderByEvent(this.orderByQuery);
  final String orderByQuery;
}
class PublicNotesSearchEvent extends NotesEvent{}