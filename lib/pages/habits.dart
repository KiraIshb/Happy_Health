import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/services/habits_class.dart';
import 'package:untitled/pages/add_habit_pages.dart';


import '../services/my_text.dart';

class ListHabits extends StatefulWidget {
  const ListHabits({super.key});

  @override
  State<ListHabits> createState() => _ListHabitsState();
}

class _ListHabitsState extends State<ListHabits> {

  List habitsList = [];

  @override
  void initState() {
    super.initState();

    habitsList.addAll([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: MyText(text: 'Привычки', isTitle: true, isDark: true),
      ),
        backgroundColor: Colors.white,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Habits').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(!snapshot.hasData) return Text('У вас нет добавленных привычек');
              return Padding(
                  padding: EdgeInsets.all(30),
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                          if (snapshot.data!.docs[index].get('user') ==
                              FirebaseAuth.instance.currentUser?.uid)
                            return Card(
                              borderOnForeground: false,
                              margin: EdgeInsets.only(bottom: 20),
                              child: Dismissible(
                                  key: Key(snapshot.data!.docs[index].id),
                                  child: classHabit(state1: snapshot.data!
                                      .docs[index].get('name'),
                                      state2: snapshot.data!.docs[index].get(
                                          'about'),
                                  ),
                                  onDismissed: (direction) {
                                    FirebaseFirestore.instance.collection('Habits')
                                        .doc(snapshot.data!.docs[index].id).delete();
                                  },
                                background: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Удалить  ',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15
                                        )
                                    ),
                                    Icon(Icons.dangerous,color: Colors.grey,),
                                    Padding(padding: EdgeInsets.only(left: 20))
                                  ],
                                ),
                              ),
                            );
                          else return Padding(padding: EdgeInsets.zero);
                    }
                  )
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AddMyHabit(habitsList: habitsList);
          });
        },
          child: Icon(Icons.add, color: Colors.white,),
          backgroundColor: Color.fromARGB(255, 13, 12, 54)
      ),
    );
  }
}