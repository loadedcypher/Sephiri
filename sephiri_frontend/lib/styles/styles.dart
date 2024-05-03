import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle? titleStyle = GoogleFonts.ubuntu(
  fontSize: 24.0,
);

InputDecoration textFormfieldDecoration(String hintText) => InputDecoration(
    hintText: hintText,
    isDense: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
    ));
