import 'package:flutter/material.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import 'login_page.dart';

class JoinPage extends StatelessWidget {
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
                "회원가입 페이지",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    // 메서드로 뺄때 최상위 부모타입과 타입 맞출 것
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
          CustomTextFormField(
            hint: "Email",
            funcValidator: validateEmail(),
          ),
          Custom_ElevatedButton(
            text: "회원가입",
            funcPageRoute: () {
              if (_formKey.currentState!.validate()) {
                Get.to(() => LoginPage());
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(LoginPage());
            },
            child: Text("로그인 페이지로 이동ㅁㄴ"),
          )
        ],
      ),
    );
  }
}
