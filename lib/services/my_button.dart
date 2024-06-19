import 'package:flutter/material.dart';
import 'package:untitled/services/my_text.dart';

class MyButton extends StatelessWidget {
  final String textButton;
  final Function()? onTap;
  const MyButton({
    super.key,
    required this.textButton,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 13, 12, 54),
          ),
          child: Center(
            child: MyText(
              text: textButton,
              isTitle: false,
              isDark: false,
            )
          )
      )
    );
  }
}


