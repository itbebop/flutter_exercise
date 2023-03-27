import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Custom_ElevatedButton extends StatelessWidget {
  final String text;
  final funcPageRoute; // 함수를 받음

  const Custom_ElevatedButton(
      {required this.text, required this.funcPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      onPressed: funcPageRoute,
      child: Text("$text"),
    );
  }
}
