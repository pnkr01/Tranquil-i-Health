//Handle onboarding.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthhero/src/theme/app_color.dart';

String logo = "assets/images/ico.gif";
String word1 = "Health";
String word2 = "Hero";
Duration kSpeed = const Duration(milliseconds: 1000);

Duration kdisplayTime = const Duration(milliseconds: 850);

//TextSTyle
String appName = 'Health Hero';
TextStyle textStyleLarge() => GoogleFonts.ubuntu(
      color: primaryColor,
      fontSize: 55,
      fontWeight: FontWeight.w700,
    );
