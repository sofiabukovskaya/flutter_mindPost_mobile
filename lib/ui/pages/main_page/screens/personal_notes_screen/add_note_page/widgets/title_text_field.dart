import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

Widget titleTextField(BuildContext context, TextEditingController titleNote) {
  return  Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 85, right: 85, bottom: 15),
        child: TextField(
          controller: titleNote,
          inputFormatters: <LengthLimitingTextInputFormatter>[
            LengthLimitingTextInputFormatter(500),
          ],
          style: textStyle(20.0, FontWeight.w600, const Color(0xFF00847c)),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            counterText: '',
            hintText: AppLocalizations.of(context)
                .translate('title_string'),
            hintStyle: textStyle(
                20.0, FontWeight.w600, const Color(0x4D00847c)),
          ),
        ),
      ));
}