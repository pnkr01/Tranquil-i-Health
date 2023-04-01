import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

// Collection ref
//-----------------------userRef------------------------------//
CollectionReference usersRef = firestore.collection('user');
//-----------------------userRef------------------------------//

//-----------------------social------------------------------//

CollectionReference postRef = firestore.collection('posts');
CollectionReference groupRef = firestore.collection('group');
//-----------------------social------------------------------//


