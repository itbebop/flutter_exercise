import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final funcValidator;

  //final String? value;
  final controller; // 컨트롤러로 생성/수정한 값 넘길 수 있게

  const CustomTextArea( // text_from_field 복사해서 TextArea 부분만 변경함
      {
    required this.hint,
    required this.funcValidator,
//    this.value,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        // 컨트롤러로 생성/수정한 값 넘길 수 있게
        // initialValue: value ?? "",
        // 오류나면 ?? "" 이부분 지울 것
        maxLines: 12,
        // 20주면 overflow 오류 나는데 이걸 쓰는 writepage에서 column이 아닌 ListView로 바꾸면 오류 안남
        validator: funcValidator,
        obscureText: hint == "Password" ? true : false,
        decoration: InputDecoration(
          hintText: "Enter $hint",
          // null 안정성이 있으므로 텍스트인거보다
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
