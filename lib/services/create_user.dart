import 'package:cloud_firestore/cloud_firestore.dart';

void createUser(String about_me, email, username, uid){
  CollectionReference users_ref =
  FirebaseFirestore.instance.collection('Users');
  Map<String, String> dataToSend = {
    'about_me': about_me,
    'username': username,
    'email': email,
    'uid': uid
  };

  //Add a new item
  //users_ref.add(dataToSend);
  users_ref.doc(uid).set(dataToSend);
}