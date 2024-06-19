import 'package:flutter/material.dart';
import 'package:untitled/services/add_habit.dart';
import 'package:untitled/services/gradient_box.dart';
import 'package:untitled/services/my_text.dart';

class ReadyHabits extends StatefulWidget {
  String name;
  String about;

  ReadyHabits({super.key, required this.name, required this.about});

  @override
  State<ReadyHabits> createState() =>
      _ReadyHabitsState(this.name, this.about);
}

class _ReadyHabitsState extends State<ReadyHabits> {
  String name;
  String about;
  _ReadyHabitsState(this.name, this.about);

  Padding habit(){
    return Padding(
      padding: EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(text: this.name, isTitle: false, isDark: true),
          Padding(padding: EdgeInsets.only(top: 5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                  child: aboutText(about)
              )
            ],
          ),
          TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.add, color: Color.fromARGB(255, 13, 12, 54)),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  Text('Добавить',
                      style: TextStyle(
                          color: Color.fromARGB(255, 13, 12, 54),
                          fontSize: 15,
                          decoration: TextDecoration.underline
                      )
                  )
                ],
              ),
              onPressed: (){
                addHabit(name, about);
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    content: MyText(text: 'Добавлено!', isTitle: false, isDark: true)
                  );
                });
              }
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Grad(
        habit(),
        'assets/gradient_full.jpg'
    );
  }
}

