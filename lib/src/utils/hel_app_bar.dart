import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:healthhero/src/theme/app_color.dart';

class HelAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HelAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.isNeededBackArrow = true,
    this.backgroundColor = whiteColor,
    this.preferredSize = const Size.fromHeight(57),
  }) : super(key: key);
  final Widget title;
  final List<Widget>? actions;
  final bool isNeededBackArrow;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      actions: actions ?? [],
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: blackColor,
            size: 20,
          )),
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  final Size preferredSize;
}
