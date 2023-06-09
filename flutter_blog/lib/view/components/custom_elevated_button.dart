import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Custom_ElevatedButton extends StatelessWidget { // 위젯으로 추출해서 따로 파일로 붙여넣은 다음에 material로 바꿔야함
  final String text; // 버튼 텍스트, constructor 만들어줌
  final funcPageRoute; // 함수를 받음. GetX 경로로 함수를 받는 것.
  // required로 하고 나중에 수정할 수도 있음
  // 원래 Function으로 정의해야하는데 final로 받음(Function으로 하면 onPressed의 파라미터가될 수 없는듯?)

  const Custom_ElevatedButton(
      {required this.text, required this.funcPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50), // 가로는 최대치, 높이만 잡음
          shape: RoundedRectangleBorder( // Rounded > borderRadius > BorderRadius.circular 그냥 숙지할 것
            borderRadius: BorderRadius.circular(20),
          )),
      onPressed: funcPageRoute,
      child: Text("$text"),
    );
  }
}
