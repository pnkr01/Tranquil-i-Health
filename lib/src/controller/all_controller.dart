import 'package:get/get.dart';
import 'package:healthhero/src/controller/auth_controller.dart';

import 'handle_onboarding_controller.dart';
import 'log_in_controller.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HandleOnBoardingController());
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    //Get.lazyPut(() => LoginController());
  }
}
