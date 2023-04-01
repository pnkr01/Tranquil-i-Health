import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthhero/src/constants/constant_literals.dart';
import 'package:healthhero/src/constants/global.dart';
import 'package:healthhero/src/model/joined_group_model.dart';
import 'package:healthhero/src/screen/pages/feed/controller/joined_group_controller.dart';
import 'package:healthhero/src/theme/app_color.dart';
import 'package:healthhero/src/utils/circular_progress.dart';

import '../../../helper/firebase_helper.dart';
import '../design/post_design.dart';

class GroupScreenView extends GetView<JoinedGroupController> {
  const GroupScreenView({
    Key? key,
    required this.route,
  }) : super(key: key);
  final String route;

  @override
  Widget build(BuildContext context) {
    printMe(route, 'inside groupscreen');
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Text(appName,
            style: kBodyTextTitleStyle().copyWith(color: whiteColor)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: RefreshIndicator(
                color: blueColor,
                onRefresh: () {
                  printMe('refreshing', 'group_screen.dart');
                  return postRef
                      .orderBy('timestamp', descending: true)
                      .limit(controller.page.value)
                      .get();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection(route)
                        .orderBy('timestamp', descending: true)
                        .limit(controller.page.value)
                        .get(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        var snap = snapshot.data;
                        List docs = snap!.docs;
                        printMe(snap, docs);
                        return ListView.builder(
                          controller: controller.scrollController,
                          itemCount: docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            JoinedGroup joinedGroup =
                                JoinedGroup.fromJson(docs[index].data());
                            printMe(joinedGroup, index);
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: DesignPost(jModel: joinedGroup),
                            );
                          },
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        printMe('printing', 'connecting');
                        return circularProgress(context, blueColor);
                      } else {
                        printMe('No feed', '90');
                        return Center(
                          child: Text('No Posts', style: kBodyTextTitleStyle()),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
