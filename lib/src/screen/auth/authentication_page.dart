import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:healthhero/src/constants/constant_literals.dart';
import 'package:healthhero/src/controller/auth_controller.dart';

import '../../controller/log_in_controller.dart';

class AuthenticationPage extends GetView<LoginController> {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFfF46A67),
                    Color(0xFfFEC28E),
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  //transform: GradientRotation(6),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Hero(
                      tag: 2,
                      child: Image.asset(
                        logo,
                        width: 120,
                      ),
                    ),

                    // SvgPicture.asset(
                    //   'assets/images/icon.svg',
                    //   width: 120,
                    // ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Sign In",
                    style: textStyleLarge().copyWith(fontSize: 18.0),
                  ),
                  Text(
                    "Acess your account",
                    style: textStyleLarge().copyWith(
                      fontSize: 18.0,
                      color: Colors.blue.shade300,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    controller.login();
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: SvgPicture.asset(
                      "assets/images/Gicon.svg",
                      width: 30,
                    ),
                  ),
                  //mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
