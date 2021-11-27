// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextParameters extends StatelessWidget {
  final String text;
  final fontSize;
  const TextParameters({Key? key, required this.text, @required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: Colors.white,
        //textStyle: Theme.of(context).textTheme.headline4,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
