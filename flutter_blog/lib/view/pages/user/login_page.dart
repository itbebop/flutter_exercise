import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../post/home_page.dart';
import 'join_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  UserController u = Get.put(UserController()); // 에러나서 앞에 final 적어야?

  final _username = TextEditingController();
  final _password = TextEditingController();

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
                "로그인 페이지 ${u.isLogin}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    // 메서드로 뺄때 최상위 부모타입과 타입 맞출 것
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "UserName",
            funcValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funcValidator: validatePassword(),
          ),
          Custom_ElevatedButton(
            text: "로그인",
            funcPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                //Get.to(() => HomePage());
                /*
                UserRepository u = UserRepository();
                u.login("ssar", "1234");
                 */
                String token = await u.login(_username.text.trim(), _password.text.trim());
                if (token != "-1"){
                  //print("토큰 정상적으로 받음");
                  Get.to(() => HomePage());
                }else{
                  //print("토큰 못받음");
                  Get.snackbar("로그인 시도", "로그인 실패");
                }
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: Text("아직 회원가입이 안되어 있는가"),
          )
        ],
      ),
    );
  }
}
