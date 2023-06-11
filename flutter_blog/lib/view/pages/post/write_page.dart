import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_Text_Area.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //PostController p = Get.find();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView( // column으로 하면 overflow 오류남
            children: [
              CustomTextFormField(
                controller: _title,
                hint: "Title",
                funcValidator: validateTitle(),
              ),
              CustomTextArea(
                controller: _content,
                hint: "Content",
                funcValidator: validateContent(),
              ),
              Custom_ElevatedButton(
                text: "글쓰기",
                funcPageRoute: () async {
                  if (_formKey.currentState!.validate()) {
                    await Get.find<PostController>().save(_title.text, _content.text); // 여기서만 쓸 거면 이렇게 한줄로 써도 됨
                    // await가 없어도 상관은 없음. 기다리면 생성될 거긴 하니깐. 그래도 기다렸다가 가는 게 더 좋긴 함
                    Get.off(()=>HomePage()); // 뒤로 가기 못하게 Get Off
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
