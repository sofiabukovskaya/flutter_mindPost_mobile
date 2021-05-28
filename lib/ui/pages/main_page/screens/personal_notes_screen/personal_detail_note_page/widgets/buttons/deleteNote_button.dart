import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteNoteButton extends StatelessWidget {
  const DeleteNoteButton(
      {Key key, @required this.onClickedYesButton})
      : super(key: key);
  final VoidCallback onClickedYesButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.red[400]
        ),
        child: const Icon(Icons.delete),
        onPressed: () {
          showDialog<dynamic>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Delete a note'),
                  actions: <TextButton>[
                    TextButton(
                        child: const Text('NO'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        }),
                    TextButton(
                        child: const Text('YES'),
                        onPressed: onClickedYesButton,)
                  ],
                );
              });
        },
      ),
    );
  }
}
