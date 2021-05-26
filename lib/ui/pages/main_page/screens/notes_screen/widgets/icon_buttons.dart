import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/profile_screen/widgets/iconButton_logout.dart';

Widget iconButtons(Function logout) {
  return Row(
    children:<Widget> [
      iconButtonLogout(logout),
      IconButton(
          icon: const Icon(
            Icons.filter_alt_sharp,
            color: Colors.black87,
          ),
          onPressed: () {})
    ],
  );
}