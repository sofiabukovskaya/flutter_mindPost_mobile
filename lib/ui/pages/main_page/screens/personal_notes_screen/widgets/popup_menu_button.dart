import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';


class PopupMenuButtonWidget extends StatelessWidget {

  const PopupMenuButtonWidget({Key key, @required this.selectedItem}) : super(key: key);
  final Function(bool) selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<dynamic>(
        color: Colors.teal[100],
        child: const Icon(
          Icons.filter_alt,
          color: Colors.black87,
        ),
        onSelected: (dynamic selected) {
          selectedItem(selected);
        },
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<dynamic>>[
            PopupMenuItem<bool>(
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context)
                      .translate('private_string'),
                  style: textStyle(14.0, FontWeight.w400, Colors.black87),
                ),
                leading: const Icon(Icons.lock_outline),
                minLeadingWidth: 10,
              ),
              value: false,
            ),
            const PopupMenuDivider(
              height: 10,
            ),
            PopupMenuItem<bool>(
              child: ListTile(
                title: Text( AppLocalizations.of(context)
                    .translate('public_string'),
                    style: textStyle(14.0, FontWeight.w400, Colors.black87)),
                leading: const Icon(Icons.lock_open_outlined),
                minLeadingWidth: 10,
              ),
              value: true,
            )
          ];
        });
  }

}