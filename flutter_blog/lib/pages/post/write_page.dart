import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_Text_Area.dart';
import 'package:flutter_blog/components/custom_text_form_field.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {

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
              ),
              CustomTextArea(
                hint: "Content",
                funcValidator: validateContent(),
              ),
              Custom_ElevatedButton(
                text: "글쓰기",
                funcPageRoute: (){
                  if(_formKey.currentState!.validate()) {
                    Get.off(HomePage());
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
