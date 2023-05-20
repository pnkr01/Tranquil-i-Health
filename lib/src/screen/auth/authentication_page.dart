import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthhero/src/controller/auth_controller.dart';
import 'package:healthhero/src/theme/app_color.dart';

import '../../controller/log_in_controller.dart';

class AuthenticationPage extends GetView<LoginController> {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: whiteColor,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Health Hero',
                  style: kBodyTextBodyAppTitleStyle(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset('assets/images/health.png'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Join the health revolution and connect with peoples',
                  style:
                      kBodyTextBodyMediumStyle().copyWith(color: primaryColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Become the part of the community and learn how to fight with your disaese',
                  style: kBodyTextBodyMediumStyle()
                      .copyWith(color: greyColor, fontSize: 14),
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4285F4),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      controller.login();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SvgPicture.asset(
                        //   "assets/images/Gicon.svg",
                        //   width: 30,
                        // ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Get Started',
                          style: kBodyTextBodyMediumStyle()
                              .copyWith(fontSize: 20, color: whiteColor),
                        )
                      ],
                    ),
                    //mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
