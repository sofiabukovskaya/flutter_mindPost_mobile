import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget descriptionText(String description) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ListTile(
      leading: Text(
        '$description',
        maxLines: 3,
        style: textStyle(18.0, FontWeight.w500, Colors.black87),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
