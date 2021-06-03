import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_mindpost/services/api/firebase_ml_api.dart';
import 'package:flutter_mindpost/ui/bloc/scan_photo_bloc/scan_photo_event.dart';
import 'package:flutter_mindpost/ui/bloc/scan_photo_bloc/scan_photo_state.dart';
import 'package:image_picker/image_picker.dart';

class ScanPhotoBloc extends Bloc<ScanPhotoEvent, ScanPhotoState>{
  ScanPhotoBloc() : super(EmptyState());

  @override
  Stream<ScanPhotoState> mapEventToState(ScanPhotoEvent event) async* {
    if(event is ScanForTextEvent){
     final  File image = event.image;
     final String text = await FirebaseMLApi.recogniseText(image);
     yield UpdateTextFieldState(text: text);
    } if(event is PickImageEvent) {
      final File file = await ImagePicker.pickImage(source: ImageSource.gallery);
      yield UpdateImageState(file: file);
    } if(event is ClearImageEvent){
      yield ClearImageAndTextState();
    }
  }
}