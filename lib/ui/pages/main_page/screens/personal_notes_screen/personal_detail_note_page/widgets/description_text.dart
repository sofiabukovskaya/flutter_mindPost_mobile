
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget descriptionText(String description){
  return  Padding(
    padding: const EdgeInsets.only(top: 30, left: 20),
    child: ListTile(
      leading: Text(
        '$description',
        style: textStyle(18.0, FontWeight.w500, Colors.black87),
        textAlign: TextAlign.center,
      ),
    ),
  );
}