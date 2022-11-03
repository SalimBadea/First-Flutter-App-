// ignore_for_file: body_might_complete_normally_nullable, must_be_immutable

import 'package:flutter/foundation.dart';
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
        onPressed: () {
          btnPressed();
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

class DefaultTextField extends StatelessWidget {
  DefaultTextField(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.textInputType,
      this.validateText,
      this.suffix,
      required this.prefix,
      required this.isPassword,
      this.suffixPressed})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType textInputType;
  String? validateText = '';
  String labelText = '';
  IconData? suffix = Icons.visibility;
  IconData prefix;
  Function? suffixPressed;
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      onChanged: (value) {
        if (kDebugMode) {
          print(value);
        }
      },
      onFieldSubmitted: (value) {
        if (kDebugMode) {
          print(value);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email must not be empty';
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: suffixPressed!(),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
