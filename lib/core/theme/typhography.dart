import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

TextStyle hl1 = GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 30,
        color: Colors.black26,
        letterSpacing: 1.1,
        fontWeight: FontWeight.bold));
TextStyle hl2 = GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 22, color: wsecondary, fontWeight: FontWeight.w400));


TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle:
        const TextStyle(fontSize: 14, color: wsecondary, letterSpacing: 1));

TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(fontSize: 14, color: wprimary));
