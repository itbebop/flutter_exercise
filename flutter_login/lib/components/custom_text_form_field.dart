import 'package:flutter/material.dart';
import 'package:flutter_login/size.dart';
import 'package:validators/validators.dart';

class CustomTextFormField extends StatelessWidget {

  final String text;
  final mValide;

  const CustomTextFormField({required this.text, required this.mValide});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$text"),
        SizedBox(height: small_gap),
        TextFormField(
          //validator: (value) => value!.isEmpty ? "Please Enter Information" : null,
          validator: mValide,
          obscureText: "$text" == "Password" ? true : false,
          decoration: InputDecoration(
            hintText: "$text" == "Email" ? "$text"+" Adress" : "$text",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            )

          ),
        )
      ],
    );
  }
}
