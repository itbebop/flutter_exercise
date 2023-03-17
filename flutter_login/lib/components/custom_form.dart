import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../size.dart';
import 'custom_text_form_field.dart';

class CustomForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
              text: "Email",
              mValide: (value) {
                print("value : $value");
                //if(value == null || value.isEmpty){
                if(value!.isEmpty){
                  return "Please Enter Information";
                } else if(!isEmail(value)){
                  return "이메일 형식이 아님";
                } else {
                  return null;
                }
              },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
              text: "Password",
              mValide: (value) {
                print("value : $value");
                //if(value == null || value.isEmpty){
                if(value!.isEmpty){
                  return "Please Enter Information";
                } else if(!isAlphanumeric(value)){
                  return "이메일 주소에는 한글이 들어갈 수 없음";
                } else if(value.toString().length > 15){
                  return "비번은 15자 이내로";
                } else {
                  return null;
                }
              },
          ),
          SizedBox(height: large_gap),
          TextButton(
            onPressed: () {
              // 유효성 검사 성공 true 리턴, 아니면 false 리턴
              if(_formKey.currentState!.validate()){
                Navigator.pushNamed(context, "/home");
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}