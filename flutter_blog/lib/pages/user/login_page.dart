import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "로그인 페이지",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() { // 메서드로 뺄때 최상위 부모타입과 타입 맞출 것
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: "UserName",
            funcValidator: validateUsername(),
          ),
          CustomTextFormField(
            hint: "Password",
            funcValidator: validatePassword(),
          ),
          Custom_ElevatedButton(
            text: "로그인",
            funcPageRoute: (){
              if(_formKey.currentState!.validate()) {
                Get.to(() => HomePage());
              }
            },
          ),
        ],
      ),
    );
  }
}


