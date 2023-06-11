import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_Text_Area.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import 'home_page.dart';

class UpdatePage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PostController p = Get.find();
    _title.text = "${p.post.value.title}";
    _content.text = "${p.post.value.content}";

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                controller: _title, // 수정한 값 컨트롤러로 전달
                  hint: "Title",
                  funcValidator: validateTitle(),
                  //value: "${p.post.value.title}"
               ),
              CustomTextArea(
                controller: _content, // controller로 수정한 값을 넘김
                hint: "Content",
                funcValidator: validateContent(),
                //value: "${p.post.value.content}", // controller로 넘기면 value값은 못넘김 (Failed assertion: line 159 pos 15: 'initialValue == null || controller == null': is not true.)
              ),
              // Homepage -> detailPage -수정> updatePage -> detailPage
              Custom_ElevatedButton(
                text: "글수정하기",
                funcPageRoute: () async {
                  if (_formKey.currentState!.validate()) {
                    await p.updateById(p.post.value.id ?? 0, _title.text, _content.text); // id는 null일 수가 없음, 오류 나서 저렇게 함
                    Get.back();
                    /* 상태관리
                      글 수정하고 뒤로가기가 되어서 갱신은 안됨 (이게 없으면 디테일 페이지가 두 개가 되어 문제됨)
                      같은 page가 있으면 이동할 때 덮어씌우기 기능이 있으면 최고지만 없어도 상태관리로 해결
                      갱신은 나중에 상태관리 Getx  라이브러리 -Obs로 해결
                    */

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
