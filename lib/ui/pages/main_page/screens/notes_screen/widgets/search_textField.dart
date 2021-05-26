import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget textFieldSearch(TextEditingController searchController) {
  return  Padding(
      padding:
      const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: textField(
          searchController,
          const Icon(Icons.search),
          const Color(0x1A008B83),
          'Search by title'));
}