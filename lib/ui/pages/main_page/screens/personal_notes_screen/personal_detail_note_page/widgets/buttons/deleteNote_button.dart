import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

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
                  title:  Text(AppLocalizations.of(context)
                      .translate('delete_note_string')),
                  actions: <TextButton>[
                    TextButton(
                        child:  Text(AppLocalizations.of(context)
                            .translate('no_string')),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        }),
                    TextButton(
                        child:  Text(AppLocalizations.of(context)
                            .translate('yes_string')),
                        onPressed: onClickedYesButton,)
                  ],
                );
              });
        },
      ),
    );
  }
}
