import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

import 'package:google_fonts/google_fonts.dart';

Widget labelText(BuildContext context){
  return Text(
    AppLocalizations.of(context).translate('welcome_string'),
    style: textStyle(18.0, FontWeight.w600, Colors.black87),
  );
}