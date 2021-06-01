import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget descriptionTextField(BuildContext context, TextEditingController descriptionNote) {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: 350,
        height: 250,
        child: TextField(
          controller: descriptionNote,
          keyboardType: TextInputType.multiline,
          maxLines: 250,
          maxLength: 500,
          style: textStyle(
              18.0, FontWeight.w400, Colors.black54),
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Write about your day thoughts, day, desires...',
              hintStyle: textStyle(20.0, FontWeight.w600,  const Color(0x4D00847c)),
              isDense: true,
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0)),
        ),
      ));
}