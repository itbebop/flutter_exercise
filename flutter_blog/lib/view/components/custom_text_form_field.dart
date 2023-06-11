import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final funcValidator;
  //final String? value; // 원래 이렇게 처음 값 넣었었는데, update페이지에서 controller로 넘기면서 value 같이 못넘김
  final controller;

  const CustomTextFormField({
    required this.hint,
    required this.funcValidator,
    //this.value,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        // controller -> ctrl+클릭 -> TextEditingController에 이미 ? 붙어있어서 required 체크 안해도 오류나지 않음
        //initialValue: value,
        // ?? null, // update받을 때 기본값 받으려고 씀, 공백이 들어가면 안돼서  ?? "" -> ?? null 바궜다가 지움
        validator: funcValidator,
        obscureText: hint == "Password" ? true : false,
        // 비밀번호일 경우 **로 표시됨
        decoration: InputDecoration(
          hintText: "Enter $hint",
          // null 안정성이 있으므로 텍스트인거보다(공백을 넣어도 null이 아니라 공백으로 됨)
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
