import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCircleLoading {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: () => Future.value(false),
        child: const SizedBox(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Colors.yellow,
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(0.3),
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
