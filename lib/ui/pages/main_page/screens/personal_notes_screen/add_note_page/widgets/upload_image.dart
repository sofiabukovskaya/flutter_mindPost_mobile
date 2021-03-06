import 'package:flutter/cupertino.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

Widget uploadImage(BuildContext context, Function loadImage) {
  return Padding(
    padding: const EdgeInsets.only(left: 100, right: 90),
    child: Row(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)
              .translate('attach_picture_string'),
          style: textStyle(18.0,FontWeight.w400, Colors.black87),
        ),
        IconButton(
            icon:const Icon(
              Icons.photo,
              color: Color(0x9900847c),
              size: 33,
            ),
            onPressed: () => loadImage()),
      ],
    ),
  );
}