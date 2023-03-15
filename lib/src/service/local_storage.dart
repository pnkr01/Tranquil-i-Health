import 'package:healthhero/src/constants/global.dart';

class LocalStorage {
  static void storeUserProfile(String name, String photourl, String email) {
    sharedPreferences.setString('name', name);
    sharedPreferences.setString('photourl', photourl);
    sharedPreferences.setString('email', email);
  }
}
