import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/bloc/profile_bloc/profile_event.dart';

Widget iconButtonLogout() {
  return IconButton(
      onPressed: () {
       //подумать еще на счет этого (как добавить ивент)
      },
      icon: const Icon(
        Icons.logout,
        color: Colors.black87,
      ));
}
