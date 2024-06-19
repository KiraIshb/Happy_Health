import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void addHabit(String name, about){
  CollectionReference habit_ref =
  FirebaseFirestore.instance.collection('Habits');
  Map<String, String> dataToSend = {
    'name': name,
    'about': about,
    'user': FirebaseAuth.instance.currentUser!.uid,
  };
  habit_ref.doc().set(dataToSend);
}