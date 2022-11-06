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
      this.isPassword = false,
      this.validate,
      this.suffix,
      this.suffixPressed})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType textInputType;
  String labelText = '';
  bool? isPassword;
  IconData? suffix = Icons.remove_red_eye_outlined;
  Function? suffixPressed;
  String? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,

      obscureText: isPassword!,

      validator: (value) {
        if (controller.text.isEmpty) {
          return '$validate field required';
        } else {
          if (labelText == 'Password') {
            if (controller.text.length < 5) {
              return 'password must 8 ';
            }
          }else if(labelText == 'Email Address'){
            if(!controller.text.contains("@")){
              return 'Enter valid Email';
            }
          }
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.email),
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: () {
            suffixPressed!();
          },
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
