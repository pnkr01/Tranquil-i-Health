import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_social_textfield/controller/social_text_editing_controller.dart';
import 'package:get/get.dart';
import 'package:healthhero/src/constants/global.dart';
import 'package:healthhero/src/screen/helper/firebase_helper.dart';
import 'package:healthhero/src/theme/app_color.dart';

class CreatePostController extends GetxController {
  User? user;
  TextEditingController writePostController = TextEditingController();
  SocialTextEditingController postController = SocialTextEditingController();
  RxString selectedList = 'Brain'.obs;
  List itemList = ['Brain', 'Eye', 'Heart', 'Lungs', 'Stomach'];
  changeIdx(String val) => selectedList.value = val;
  getUserProfile() => firebaseAuth.currentUser?.photoURL;

  String? get getUserImg => firebaseAuth.currentUser?.photoURL;
  String get getPostImgUrl => '';

  Rx<PlatformFile>? pickedFile;

  postbutton(String imgUrl) async {
    if (writePostController.text.isNotEmpty) {
      await firestore.collection(selectedList.value).doc().set({
        'userImg': getUserImg,
        'userName': sharedPreferences.getString('name'),
        'timestamp': DateTime.now(),
        'postText': writePostController.value.text,
        'postimgUrl': imgUrl,
      }).then((value) {
        Get.back();
        Get.back();
        showSnackBar('Your post is live', greenColor, blackColor);
      });
    }
  }

  handleFileUpload() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      pickedFile?.value = result.files.first;
    }
  }
}
