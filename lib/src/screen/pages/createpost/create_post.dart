import 'package:flutter/material.dart';
import 'package:healthhero/src/widgets/app_bar.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Scaffold(
        appBar: CustomAppBar(title: 'Create Post'),
      ),
    );
  }
}
