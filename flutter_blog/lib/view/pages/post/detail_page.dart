import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int? id; // int가 null이 들어올 수도 있으므로

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments; // 넘길때 다이나믹타입이라 받을 때 타입을 지정해줌

    UserController u = Get.find();
    PostController p = Get.find();
    print("로그인 유저아이디 : ${u.principal.value.id}");
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "게시글 아이디 : $id, 로그인 상태 : ${u.isLogin}",
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            children: [
              Text(
                "${p.post.value.title}", // value붙여야
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Divider(),
              u.principal.value.id == p.post.value.user!.id
                  ? Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await p.deleteById(p.post.value.id!);
                            Get.off(() => HomePage());
                            // Get.back(); // 이래도 삭제 후 갱신은 되는데, 그래도 off가 맞음
                            // 뒤로가기(Get.back), Get.to(HomePage()), Get.off 중 아무거나 써도?
                            // 상태관리로 관리할 수 있어서 상관없음?
                          },
                          child: Text("삭제"),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => UpdatePage());
                          },
                          child: Text("수정"),
                        ),
                      ],
                    )
                  : SizedBox(),
              Expanded(
                // 글 내용 길어질 수 있으므로 Scroll되도록
                // ListView로 하기엔 Text하나밖에 없으므로 이런 식으로 함
                child: SingleChildScrollView(
                  child: Text("${p.post.value.content}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
