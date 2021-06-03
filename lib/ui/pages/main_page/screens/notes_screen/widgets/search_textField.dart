import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

Widget textFieldSearch(BuildContext context, TextEditingController searchController) {
  return  Padding(
      padding:
      const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: searchTextField(
          searchController,
          const Icon(Icons.search),
          const Color(0x1A008B83),
          AppLocalizations.of(context).translate('search_by_title_string')));
}