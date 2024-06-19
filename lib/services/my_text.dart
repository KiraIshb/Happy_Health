import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final bool isTitle;
  final bool isDark;
  const MyText({
    super.key,
    required this.text,
    required this.isTitle,
    required this.isDark
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: isTitle? 30 : 20,
        color: isDark? Color.fromARGB(255, 13, 12, 54) : Colors.white,
        fontWeight: FontWeight.w500
      ),
    );
  }
}

Text aboutText(String text){
  return Text(
    text,
    style: TextStyle(
        fontSize: 17,
        color: Color.fromARGB(255, 13, 12, 54),
        fontWeight: FontWeight.w400
    ),
  );
}