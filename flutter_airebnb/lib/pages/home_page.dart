import 'package:flutter/material.dart';
import 'package:flutter_airebnb/components/home/home_body.dart';
import 'package:flutter_airebnb/components/home/home_header.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        HomeHeader(), // ListView 안에서는 자식들이 최대로 width 잡음
        HomeBody(),
      ],
    ));
  }
}
