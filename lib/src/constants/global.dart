import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

printMe(var e, var hint) {
  if (kDebugMode) {
    print("${e.toString()}------------------${hint.toString()}");
  }
}
