import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {

  final String hint;
  final funcValidator;

  const CustomTextArea({required this.hint, required this.funcValidator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLines: 12,
        validator: funcValidator,
        obscureText: hint=="Password" ? true : false,
        decoration: InputDecoration(
          hintText: "Enter $hint", // null 안정성이 있으므로 텍스트인거보다
          // 이렇게 변수로 넣는 것이 좋다.
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),

        ),
      ),
    );
  }
}