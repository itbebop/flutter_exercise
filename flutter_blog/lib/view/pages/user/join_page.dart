import 'package:flutter/material.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import 'login_page.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  /*
  validator 작업순서
  1. validator 라이브러리 pub get
  2. 상태관리하는 final _formKey 만들기 (로그인페이지에도 있어야)
  3. Form에 key 달기 -> 외부에서도 form 컨트롤 할 수 있음
  4. custom_text_form_field에 final funcValidator; 생성, 생성자도 만듬, validator 파라미터로 받음
    ㄴ 비번이 될 수도 있고, id가 될 수도 있으므로 파라미터로 받는 것
  5. PageLoute쪽에서 if문으로 조건 걸기, null체크(절대 null이 아님)
  6. print(value); 자리에서 if문으로 로직 짜고 util로 따로 빼기
  7. 뺴는 방식은 validator_util.dart 참고
   */

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
      /*
      작업순서
      1. TextFromField 만들어서 따로 Extract Widget으로 뺌
      (이 페이지에서만 쓸 거면 Method로 추출, 다른 페이지에서도 쓸 거면 Widget으로 추출)
      2. 따로 뺀 CustomTextFormField를 여러개 복사, 파라미터로 hint 전달
      3. ElevatedButton 생성하고 따로 Extract Widget으로 뺌
      4. text는 역시 파라미터로 전달
      5. form으로 감싸줌. 서버로 데이터 보내야 하므로
      6. Ctrl+Alt+M -> 메서드화 시킴 -> _joinForm()으로 정리
      7. 윗 부분 (회원가입 페이지) 넣기
      8. 로그인 페이지도 동일하게 하고, 이름바꾸고 이메일 지우고 페이지 이름 변경
       */
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: "UserName",
            funcValidator: validateUsername(),
            /* funcValidator: (value) {
                 print(value); 라고 하면 입력된 값 출력됨

             */
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
              if (_formKey.currentState!.validate()) { // validation 체크 (validators 라이브러리), null 체크(절대 null이 아님)
                  Get.to(() => LoginPage()); // import할때 get.main이 아니라 get.dart해야
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(LoginPage());
            },
            child: Text("로그인 페이지로 이동"),
          )
        ],
      ),
    );
  }
}
