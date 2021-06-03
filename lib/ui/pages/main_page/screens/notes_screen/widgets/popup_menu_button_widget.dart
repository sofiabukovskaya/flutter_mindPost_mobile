
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

class PopupMenuButtonWidget extends StatelessWidget {

  const PopupMenuButtonWidget({Key key, @required this.selectedItem}) : super(key: key);
  final Function(String) selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<dynamic>(
        color: Colors.teal[100],
        child: const Icon(
          Icons.sort,
          color: Colors.black87,
        ),
        onSelected: (dynamic selected) {
          selectedItem(selected);
        },
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              enabled: false,
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context).translate('order_by_string'),
                  style: textStyle(14.0, FontWeight.w400, Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            PopupMenuItem<String>(
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context).translate('by_title_string'),
                  style: textStyle(14.0, FontWeight.w400, Colors.black87),
                ),
                leading: const Icon(Icons.text_fields),
                minLeadingWidth: 10,
              ),
              value: 'title',
            ),
            const PopupMenuDivider(
              height: 10,
            ),
            PopupMenuItem<String>(
              child: ListTile(
                title: Text(AppLocalizations.of(context).translate('by_author_string'),
                    style: textStyle(14.0, FontWeight.w400, Colors.black87)),
                leading: const Icon(Icons.person),
                minLeadingWidth: 10,
              ),
              value: 'user_nickname',
            ),
            const PopupMenuDivider(
              height: 10,
            ),
            PopupMenuItem<String>(
              child: ListTile(
                title: Text(AppLocalizations.of(context).translate('by_count_likes_string'),
                    style: textStyle(14.0, FontWeight.w400, Colors.black87)),
                leading: const Icon(Icons.favorite),
                minLeadingWidth: 10,
              ),
              value: 'like',
            ),
            const PopupMenuDivider(
              height: 10,
            ),
            PopupMenuItem<String>(
              child: ListTile(
                title: Text(AppLocalizations.of(context).translate('by_count_dislikes_string'),
                    style: textStyle(14.0, FontWeight.w400, Colors.black87)),
                leading: const Icon(Icons.cancel_outlined),
                minLeadingWidth: 10,
              ),
              value: 'dislike',
            )
          ];
        });
  }

}