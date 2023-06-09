import 'package:flutter/material.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/post/write_page.dart';
import 'package:flutter_blog/view/pages/user/join_page.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // GetX 사용 (MaterialApp -> GetMaterialApp으로 변경, import)
      debugShowCheckedModeBanner: false,
      // 라우트 설계 필요없음. GetX 사용할 예정
      home: WritePage(),
    );
  }
}
