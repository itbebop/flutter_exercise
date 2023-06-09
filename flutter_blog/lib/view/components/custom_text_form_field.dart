import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final funcValidator;
  final String? value;
  final controller;

  const CustomTextFormField(
      {required this.hint, required this.funcValidator, this.value, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        initialValue: value, // ?? null,
        validator: funcValidator,
         obscureText: hint == "Password" ? true : false, // 비밀번호일 경우 **로 표시됨
        decoration: InputDecoration(
          hintText: "Enter $hint", // null 안정성이 있으므로 텍스트인거보다(공백을 넣어도 null이 아니라 공백으로 됨)
          // 이렇게 변수로 넣는 것이 좋다.
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
