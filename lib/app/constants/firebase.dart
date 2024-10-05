import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore firebaseFirestoreInstace=FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage firebaseStorage =FirebaseStorage.instance;
CollectionReference userCollection =firebaseFirestoreInstace.collection('Users');
CollectionReference eventCollection =firebaseFirestoreInstace.collection('Events');