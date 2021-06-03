import 'dart:io';

class ScanPhotoEvent{}

class PickImageEvent extends ScanPhotoEvent {
}
class ScanForTextEvent extends ScanPhotoEvent {
  ScanForTextEvent(this.image);
 final File image;
}
class ClearImageEvent extends ScanPhotoEvent {}
class CopyTextEvent extends ScanPhotoEvent{}