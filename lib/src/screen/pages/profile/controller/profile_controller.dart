import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthhero/src/constants/global.dart';
import 'package:healthhero/src/screen/pages/profile/components/camer_view.dart';
import 'package:healthhero/src/screen/pages/profile/components/fav_view.dart';
import 'package:healthhero/src/screen/pages/profile/components/grid_view.dart';

class ProfileController extends GetxController {
  List profilePages = [
    {
      'icon': Icons.grid_view,
      'page': const GridViewScreen(),
      'index': 0,
    },
    {
      'icon': Icons.video_call,
      'page': const CameraViewScreen(),
      'index': 1,
    },
    {
      'icon': Icons.favorite,
      'page': const FavViewScreen(),
      'index': 2,
    },
  ];
  RxInt idx = 0.obs;
  changeIdx(val) => idx.value = val;
  String get getUserName => sharedPreferences.getString('name') ?? 'Unknown';
  String get getUserImageUrl =>
      sharedPreferences.getString('photourl') ?? 'Unknown';
  String get getUserEmail => sharedPreferences.getString('email') ?? 'Unknown';
}
