import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthhero/src/theme/app_color.dart';

class AddIconContainer extends StatelessWidget {
  const AddIconContainer({
    Key? key,
    this.page,
    required this.icon,
    required this.mini,
  }) : super(key: key);
  final Widget? page;
  final IconData icon;
  final bool mini;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (BuildContext context, VoidCallback _) {
        return page!;
      },
      closedElevation: 4.0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(56 / 2),
        ),
      ),
      closedColor: Theme.of(context).scaffoldBackgroundColor,
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            chooseUpload(context);
          },
          mini: mini,
          child: Icon(
            icon,
            color: whiteColor,
          ),
        );
      },
    );
  }

  chooseUpload(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: .4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Text(
                    'Choose Upload',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.camera_on_rectangle,
                  size: 25.0,
                ),
                title: const Text('Make a post'),
                onTap: () {
                  // Navigator.pop(context);
                  // Navigator.of(context).push(
                  //   CupertinoPageRoute(
                  //     builder: (_) => CreatePost(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.camera_on_rectangle,
                  size: 25.0,
                ),
                title: const Text('Add to story'),
                onTap: () async {
                  // await viewModel.pickImage(context: context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
