import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget switchItem(BuildContext context, bool switched, Icon lockedIcon, Function(bool) changeIcon) {
  return Padding(
      padding: const EdgeInsets.only(left: 150, top: 12),
      child: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
            value: switched,
            onChanged: (bool value) {
              changeIcon(value);
              // setState(() {
              //   switched = value;
              //   switched == false
              //       ? lockedIcon = const Icon(
              //     Icons.lock_outline,
              //     color: Colors.black54,
              //     size: 30,
              //   )
              //       : lockedIcon = const Icon(
              //     Icons.lock_open_sharp,
              //     color: Colors.black54,
              //     size: 30,
              //   );
              // });
            }),
      ));
}