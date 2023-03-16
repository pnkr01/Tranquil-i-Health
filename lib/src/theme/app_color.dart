import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color primaryForegroundColor = Color(0XFFC489DF);
const Color inactiveIconColor = Color(0XFFAEAEB3);
const Color blackColor = Colors.black;
const Color whiteColor = Colors.white;
const Color greyColor = Color(0xFFC4C4C4);

TextStyle kTitleTextStyle() {
  return GoogleFonts.montserrat(color: Colors.white, fontSize: 12.sp);
}

TextStyle kBodyTextTitleStyle() {
  return GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
  );
}

TextStyle kBodyTextSubtitleStyle() {
  return GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
}
TextStyle kBodyTextBodyMediumStyle() {
  return GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );
}
