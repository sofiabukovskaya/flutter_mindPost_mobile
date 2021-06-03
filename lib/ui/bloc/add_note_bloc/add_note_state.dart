class AddNoteState{}

class SuccessfulAddNoteState extends AddNoteState{}

class FailAddNoteState extends AddNoteState{}

class DisplayAddingImageState extends AddNoteState{}

class ChangeLockIconState extends AddNoteState{
  ChangeLockIconState(this.selectedItem);
  final bool selectedItem;
}

class EmptyState extends AddNoteState{}