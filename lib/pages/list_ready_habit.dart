import 'package:flutter/material.dart';
import 'package:untitled/services/gradient_box.dart';


import '../services/my_text.dart';
import 'add_ready_habits.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({super.key});

  TextButton SelectCategory(String category, BuildContext context){
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(text: category, isDark: true,  isTitle: false,)
        ],
      ),
      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(25))),
      onPressed: () {
        showDialog(context: context, builder: (BuildContext context){
          return ListReadyHabits(category);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MyText(text: 'Готовые привычки', isTitle: true, isDark: true),
        ),
        body: Padding(padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Grad(SelectCategory('Здоровье', context), 'assets/gradient1.jpg'),
              Padding(padding: EdgeInsets.only(top: 20)),
              Grad(SelectCategory('Физическая активность', context), 'assets/gradient2.jpg'),
              Padding(padding: EdgeInsets.only(top: 20)),
              Grad(SelectCategory('Питание', context), 'assets/gradient3.jpg'),
              Padding(padding: EdgeInsets.only(top: 20)),
              Grad(SelectCategory('Распорядок дня', context), 'assets/gradient4.jpg'),
              Padding(padding: EdgeInsets.only(top: 5)),
              Expanded(child: Image.asset('assets/animal2.png'))
            ],
          )
        )
    );
  }
}
