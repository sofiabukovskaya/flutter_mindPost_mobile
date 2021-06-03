import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget switchItem(BuildContext context, bool switched, Icon lockedIcon, Function(bool) changeIcon) {
  return Padding(
      padding: const EdgeInsets.only(left: 135, top: 12),
      child: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
            value: switched,
            onChanged: (bool value) {
              changeIcon(value);
            }),
      ));
}