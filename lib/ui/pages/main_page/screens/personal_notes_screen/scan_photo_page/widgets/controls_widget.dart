import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final VoidCallback onClickedClear;

  const ControlsWidget({
    @required this.onClickedPickImage,
    @required this.onClickedScanText,
    @required this.onClickedClear,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: Colors.teal[200],
        onPressed: onClickedPickImage,
        child: Text('Pick Image', style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500
        ),),
      ),
      const SizedBox(width: 12),
      FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: Colors.teal[200],
        onPressed: onClickedScanText,
        child: Text('Scan For Text', style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500
        )),
      ),
      const SizedBox(width: 12),
      FlatButton(
        onPressed: onClickedClear,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: Colors.teal[200],
        child: Text('Clear', style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500
        )),
      )
    ],
  );
}