import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/size.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:flutter_blog/view/pages/post/write_page.dart';
import 'package:get/get.dart';

import '../user/login_page.dart';
import '../user/user_info.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //UserController u = Get.put(UserController());
    // put : 없으면 만들고, 있으면 찾기
    UserController u = Get.find();
    // 객체 생성(create), 초기화 (initialize)
    PostController p = Get.put(PostController());
    //p.findAll();

    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(
        title: Obx(() => Text("${u.isLogin}")), // Obx로 묶어야 변경/관찰 가능한 변수가 됨
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: p.posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () async {
                await p.findById(p.posts[index].id!); // null이 절대 아님,
                // post_controller에서 id 받을때 await하므로 여기서도 기다려야 함ㄴㄴㅁ
                Get.to(() => DetailPage(p.posts[index].id),
                    // DetailPage의 int id null처리해줘야함
                    arguments: "arguments 속성 테스트");
              },
              title: Text("${p.posts[index].title}"),
              leading: Text("${p.posts[index].id}"),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    UserController u = Get.find();

    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(() => WritePage());
                },
                child: Text(
                  "글쓰기",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Get.to(() => UserInfo());
                },
                child: Text(
                  "회원정보보기",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  u.logout();
                  Get.to(LoginPage());
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
