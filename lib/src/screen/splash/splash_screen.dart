// ignore: import_of_legacy_library_into_null_safe
import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../constants/constant_literals.dart';

class HandleOnBoarding extends StatelessWidget {
  const HandleOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 450,
              child: Center(
                child: RiveAnimation.asset('assets/images/loading.riv'),
              ),
            ),
            SizedBox(
              height: 80,
              width: 200,
              child: AnimatedText(
                alignment: Alignment.center,
                speed: kSpeed,
                controller: AnimatedTextController.play,
                displayTime: kdisplayTime,
                wordList: [word1, word2],
                textStyle: textStyleLarge(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
