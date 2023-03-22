import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthhero/src/constants/global.dart';
import 'package:healthhero/src/screen/pages/profile/controller/profile_controller.dart';
import 'package:healthhero/src/theme/app_color.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: whiteColor,
          centerTitle: true,
          title: Text(
            'Profile',
            style: kBodyTextTitleStyle(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Align(
                  child: CircleAvatar(
                    radius: 50.h, // Image radius
                    backgroundImage: NetworkImage(controller.user?.photoURL ??
                        'https://i.pinimg.com/564x/16/dd/1a/16dd1abb3f890a59e454149884a19a7c.jpg'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${controller.getUserName.capitalizeFirst}',
                  style: kBodyTextTitleStyle(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _userInfo(),
                      const SizedBox(height: 20),
                      //_userActions(),
                      // const SizedBox(height: 20),
                      Obx(
                        () => SizedBox(
                          height: 48,
                          child: AppBar(
                            backgroundColor: whiteColor,
                            elevation: 0,
                            bottom: TabBar(
                              indicatorColor: primaryForegroundColor,
                              tabs: List.generate(
                                3,
                                (index) => Tab(
                                    child: GestureDetector(
                                  onTap: () {
                                    controller.changeIdx(index);
                                    printMe(controller.idx.value, index);
                                  },
                                  child: Icon(
                                    controller.profilePages[index]["icon"],
                                    color: index == controller.idx.value
                                        ? primaryForegroundColor
                                        : greyColor,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: 500,
                          child: TabBarView(
                            physics: const ScrollPhysics(),
                            children: List.generate(
                              3,
                              (index) => controller.profilePages[index]["page"],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _userActions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: primaryForegroundColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.person_add,
                    color: whiteColor,
                    size: 25,
                  ),
                ),
                const SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Follow',
                    style: kBodyTextTitleStyle().copyWith(color: whiteColor),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 50,
            //width: 130,
            decoration: BoxDecoration(
              border: Border.all(color: primaryForegroundColor, width: 2),
              color: whiteColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.sms,
                    color: primaryForegroundColor,
                    //  size: 25,
                  ),
                ),
                const SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    'Message',
                    style: kBodyTextTitleStyle()
                        .copyWith(color: primaryForegroundColor),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffFAF6FE),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            // height: 50,
            // width: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Ionicons.logo_twitter,
                color: primaryForegroundColor,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffFAF6FE),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            // height: 50,
            // width: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.expand_more,
                color: primaryForegroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _userInfo() {
    // printMe(postLengthRef.doc(controller.user?.email.toString()).get(), 'hint');
    // FutureBuilder(
    //     future: postLengthRef.get(),
    //     builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasData) {
    //         printMe(snapshot.data, 'hint');
    //         return const Text('data');
    //       } else {
    //         printMe(snapshot.data, 'hint');
    //         return const Text('data');
    //       }
    //     }));
    // StreamBuilder(
    //     stream:
    //         postLengthRef.doc(controller.user?.email.toString()).snapshots(),
    //     builder: (context, AsyncSnapshot snapshot) =>
    //         printMe(snapshot.data.docs, 'hint'));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            // StreamBuilder(
            //   stream: postLengthRef
            //       .doc(controller.user?.email.toString())
            //       .snapshots(),
            //   builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
            //       ? Text(snapshot.data!.docs["post"].toString())
            //       : const Text('0'),
            // ),
            FutureBuilder(
                future: controller.getPostLength(),
                builder: (context, snapshot) => snapshot.hasData
                    ? Text(
                        snapshot.data.toString(),
                        style: kBodyTextTitleStyle(),
                      )
                    : Text('0', style: kBodyTextTitleStyle())),
            //  Text(controller.getPostLength().toString()),
            const SizedBox(height: 10),
            const Text('Posts'),
          ],
        ),
        Container(
          color: Colors.black45,
          height: 50,
          width: 2,
        ),
        Column(
          children: [
            FutureBuilder(
                future: controller.getFollowersLength(),
                builder: (context, snapshot) => snapshot.hasData
                    ? Text(
                        snapshot.data.toString(),
                        style: kBodyTextTitleStyle(),
                      )
                    : Text('0', style: kBodyTextTitleStyle())),
            const SizedBox(height: 10),
            const Text('Followers'),
          ],
        ),
        Container(
          color: Colors.black45,
          height: 50,
          width: 2,
        ),
        Column(
          children: [
            FutureBuilder(
                future: controller.getFollowingLength(),
                builder: (context, snapshot) => snapshot.hasData
                    ? Text(
                        snapshot.data.toString(),
                        style: kBodyTextTitleStyle(),
                      )
                    : Text('0', style: kBodyTextTitleStyle())),
            const SizedBox(height: 10),
            const Text('Following'),
          ],
        ),
        Container(
          color: Colors.black45,
          height: 50,
          width: 2,
        ),
        Column(
          children: [
            FutureBuilder(
                future: controller.getTotalLikesLength(),
                builder: (context, snapshot) => snapshot.hasData
                    ? Text(
                        snapshot.data.toString(),
                        style: kBodyTextTitleStyle(),
                      )
                    : Text('0', style: kBodyTextTitleStyle())),
            const SizedBox(height: 10),
            const Text('Likes'),
          ],
        ),
      ],
    );
  }
}
