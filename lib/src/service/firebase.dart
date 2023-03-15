import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthhero/src/service/local_storage.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class FirebaseClass {
  static void uploadUserProfileAndSaveLocally(
      String name, String photurl, String email, String uid) async {
    await FirebaseFirestore.instance.collection('user').doc(email).set({
      'name': name,
      'photourl': photurl,
      'email': email,
      'uid': uid,
    }).then((value) => LocalStorage.storeUserProfile(name, photurl, email));
  }
}
