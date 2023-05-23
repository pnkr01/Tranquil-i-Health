import 'package:flutter/material.dart';

import 'package:healthhero/src/helper/percentage_builder.dart';
import 'package:healthhero/src/screen/helper/firebase_helper.dart';
import 'package:healthhero/src/theme/app_color.dart';

class CustomHospitalRankingScreen extends StatefulWidget {
  const CustomHospitalRankingScreen({
    Key? key,
    required this.appbarText,
    required this.hospitalName,
  }) : super(key: key);
  final String appbarText;
  final String hospitalName;

  @override
  State<CustomHospitalRankingScreen> createState() =>
      _CustomHospitalRankingScreenState();
}

class _CustomHospitalRankingScreenState
    extends State<CustomHospitalRankingScreen> {
  @override
  void initState() {
    getAvgValue();
    super.initState();
  }

  late final count;
  late final score;
  late final dscore;
  late final dcount;
  late final gavg;
  late final bavg;

  getAvgValue() async {
    firestore
        .collection('hospital')
        .doc(widget.hospitalName)
        .get()
        .then((value) {
      count = value["count"];
      score = value["score"];
      dscore = value["dscore"];
      dcount = value["dcount"];
      calculateAvg(score, count, dcount, dscore);
    });
  }

  calculateAvg(num score, num count, num dcount, num dscore) {
    gavg = score / count;
    bavg = dscore / dcount;
    isLoading = !isLoading;
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(widget.appbarText),
      ),
      body: !isLoading
          ? Column(
              children: [
                PercentageContainer(
                  percentage: gavg,
                  color: Colors.amber,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Good %'),
                PercentageContainer(
                  percentage: bavg,
                  color: Colors.amber,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Bad %'),
                const SizedBox(
                  height: 40,
                ),
                const Text('System recommendation is '),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(color: primaryColor),
            ),
    );
  }
}
