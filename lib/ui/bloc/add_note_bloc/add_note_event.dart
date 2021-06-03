import 'dart:io';


class AddNoteEvent{}

class AddNoteTextEvent extends AddNoteEvent{
  AddNoteTextEvent(this.titleNote, this.descriptionNote, this.uploadedFileUrl, this.switched, this.dateFormat);
  final String titleNote;
  final String descriptionNote;
  final String uploadedFileUrl;
  final bool switched;
  final String dateFormat;
}
class UploadImageEvent extends AddNoteEvent{
  UploadImageEvent(this.image, this.uploadedFileUrl);
  final File image;
  final String uploadedFileUrl;
}
class PickImageFromStorage extends AddNoteEvent{}

class ChangeLockIconEvent extends AddNoteEvent{
  ChangeLockIconEvent(this.selectedItem);
  final bool selectedItem;
}