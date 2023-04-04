// ignore: import_of_legacy_library_into_null_safe
import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:healthhero/src/constants/constant_literals.dart';
import 'package:healthhero/src/theme/app_color.dart';

class HandleOnBoarding extends StatelessWidget {
  const HandleOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Center(
              child: Hero(
                tag: 'hero-1',
                child: Image.asset(logo),
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
