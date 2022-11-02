import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function btnPressed,
  required String text,
}) =>
    Container(
      color: background,
      width: width,
      child: MaterialButton(
        onPressed: (){
          btnPressed();
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
