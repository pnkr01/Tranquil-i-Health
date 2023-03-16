import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthhero/src/screen/pages/controller/home_controller.dart';
import 'package:healthhero/src/theme/app_color.dart';
import 'package:healthhero/src/utils/fab_container.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: Obx(
        () => PageTransitionSwitcher(
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: controller.pages[controller.index.value]['page'],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 5),
              for (Map item in controller.pages)
                item['index'] == 2
                    ? buildPlusButton()
                    : Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                        child: item['index'] == controller.index.value
                            ? Container(
                                height: 45,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: item['index'] != controller.index.value
                                      ? Colors.black
                                      : primaryForegroundColor,
                                ),
                                child: IconButton(
                                  icon: Center(
                                    child: Icon(
                                      item['icon'],
                                      color: whiteColor,
                                      size: 25.0,
                                    ),
                                  ),
                                  onPressed: () =>
                                      navigationTapped(item['index']),
                                ),
                              )
                            : IconButton(
                                icon: Icon(
                                  item['icon'],
                                  color: const Color(0xFFC4C4C4),
                                  size: 25.0,
                                ),
                                onPressed: () =>
                                    navigationTapped(item['index']),
                              ),
                      ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }

  buildPlusButton() {
    return const SizedBox(
      height: 45.0,
      width: 45.0,
      // ignore: missing_required_param
      child: AddIconContainer(
        icon: Ionicons.add_outline,
        mini: true,
      ),
    );
  }

  void navigationTapped(int page) {
    controller.changeIndex(page);
  }
}
