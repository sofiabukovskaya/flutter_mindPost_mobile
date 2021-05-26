import 'package:flutter/material.dart';

Widget iconButtonLogout(Function logout) {
  return IconButton(
      onPressed: () {
        logout();
      },
      icon: const Icon(
        Icons.logout,
        color: Colors.black87,
      ));
}
