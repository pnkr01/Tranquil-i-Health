//Handle onboarding.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String logo = "assets/images/ico.gif";
String word1 = "Health";
String word2 = "hero";
Duration kSpeed = const Duration(milliseconds: 1000);

Duration kdisplayTime = const Duration(milliseconds: 600);

//TextSTyle
TextStyle textStyleLarge() => GoogleFonts.ubuntu(
      color: Colors.blue,
      fontSize: 55,
      fontWeight: FontWeight.w700,
    );
