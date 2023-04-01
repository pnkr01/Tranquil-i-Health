import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthhero/src/controller/auth_controller.dart';
import 'package:healthhero/src/service/firebase.dart';
import 'package:healthhero/src/widgets/custom_circular.dart';

class LoginController extends GetxController {
  AuthController authController = Get.find<AuthController>();

  @override
  void onClose() {
    AuthController().dispose();
    LoginController().dispose();
  }

  void login() async {
    CustomCircleLoading.showDialog();
    GoogleSignInAccount? googleSignInAccount =
        await authController.googleSignIn.signIn();
    if (googleSignInAccount == null) {
      CustomCircleLoading.cancelDialog();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      final UserCredential credential = await authController.firebaseAuth
          .signInWithCredential(oAuthCredential)
          .then((value) => saveUserInformationToFirebaseAndLocally(
              googleSignInAccount.displayName,
              googleSignInAccount.email,
              googleSignInAccount.photoUrl,
              value.user!.uid));

      if (kDebugMode) {
        print(oAuthCredential);
        print(credential);
        print(googleSignInAccount);
      }

      CustomCircleLoading.cancelDialog();
    }
  }
}

saveUserInformationToFirebaseAndLocally(
    String? name, String email, String? photourl, String id) {
  FirebaseClass.uploadUserProfileAndSaveLocally(
      name ?? 'user', photourl ?? '', email, id);
}
