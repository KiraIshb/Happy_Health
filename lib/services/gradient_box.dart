import 'package:flutter/material.dart';

DecoratedBox Grad(Widget widget, String backImage)
{
  return DecoratedBox(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backImage),
            fit: BoxFit.none
        ),
        borderRadius: BorderRadius.circular(22)
    ),
    child: widget,
  );
}