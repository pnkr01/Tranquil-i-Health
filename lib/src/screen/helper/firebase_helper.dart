import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
const Uuid uuid = Uuid();

// Collection ref
//-----------------------userRef------------------------------//
CollectionReference usersRef = firestore.collection('user');
//-----------------------userRef------------------------------//

//-----------------------social------------------------------//

CollectionReference postRef = firestore.collection('posts');
CollectionReference groupRef = firestore.collection('group');
//-----------------------social------------------------------//

