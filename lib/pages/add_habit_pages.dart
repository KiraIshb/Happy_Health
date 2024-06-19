import 'package:flutter/material.dart';
import 'package:untitled/services/my_button.dart';
import 'package:untitled/services/my_text.dart';

import '../services/add_habit.dart';

class AddMyHabit extends StatefulWidget {

  final List habitsList;

  const AddMyHabit({super.key, required this.habitsList});

  @override
  State<AddMyHabit> createState() => _AddMyHabitState();
}

class _AddMyHabitState extends State<AddMyHabit> {
  List habitsList = [];
  late String name_hab;
  late String about_hab;

  List getListHabits(){
    return habitsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: MyText(text: 'Привычка', isTitle: true, isDark: true),
      ),
        body: Padding(
          padding: EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Название',
                isTitle: false,
                isDark: true
              ),
              TextField(
                onChanged: (String value) {
                  name_hab=value;
                },
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              MyText(
                  text: 'Описание',
                  isTitle: false,
                  isDark: true
              ),
              TextField(
                onChanged: (String value) {
                  about_hab=value;
                },
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Padding(padding: EdgeInsets.only(top: 20)),
              Padding(padding: EdgeInsets.only(top: 50)),
              MyButton(
                textButton: 'Добавить привычку',
                onTap: () {
                  addHabit(name_hab, about_hab);
                  Navigator.of(context).pop();
                })
            ],
        ),
      )
    );
  }
}
