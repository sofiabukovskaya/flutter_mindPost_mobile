import 'dart:io';

import 'package:flutter/cupertino.dart';

class ScanPhotoState{}

class UpdateImageState extends ScanPhotoState{
  UpdateImageState({@required this.file});
  File file;
}
class UpdateTextFieldState extends ScanPhotoState{
  UpdateTextFieldState({@required this.text});
   String text;
}
class ClearImageAndTextState extends ScanPhotoState{}
class FailPickImageState extends ScanPhotoState{}
class EmptyState extends ScanPhotoState{}