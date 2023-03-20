import 'package:flutter/material.dart';
import 'package:flutter_airebnb/constants.dart';
import 'package:flutter_airebnb/size.dart';
import 'package:flutter_airebnb/styles.dart';

class HomeHeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: Row(
        children: [
          _buildAppBarLogo(),
          Spacer(),
          _buildAppBarMenu(),
        ],
      ),
    );
  }
}

Widget _buildAppBarLogo() {
  return Row(
    children: [
      Image.asset(
        "assets/logo.png",
        width: 30,
        height: 30,
        color: kAccentColor,
      ),
      SizedBox(
        width: gap_s,
      ),
      Text(
        "airbnb",
        style: h5(mColor: Colors.white),
      )
    ],
  );
}

Widget _buildAppBarMenu() {
  return Row(
    children: [
      Text(
        "회원가입",
        style: subtitle1(mColor: Colors.white),
      ),
      SizedBox(
        width: gap_m,
      ),
      Text(
        "로그인",
        style: subtitle1(mColor: Colors.white),
      ),
    ],
  );
}
