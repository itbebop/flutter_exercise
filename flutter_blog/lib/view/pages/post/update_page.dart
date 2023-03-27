import 'package:flutter/material.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_Text_Area.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import 'home_page.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                  hint: "Title",
                  funcValidator: validateTitle(),
                  value: "제목1" * 2),
              CustomTextArea(
                hint: "Content",
                funcValidator: validateContent(),
                value: "내용1" * 20,
              ),
              // Homepage -> detailPage -수정> updatePage -> detailPage
              Custom_ElevatedButton(
                text: "글수정하기",
                funcPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    // 같은 page가 있으면 이동할 때 덮어씌우기 기능이 있으면 최고지만 없어도 상태관리로 해결
                    Get.back(); // 갱신은 나중에 상태관리 Getx  라이브러리 -Obs로 해결
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
