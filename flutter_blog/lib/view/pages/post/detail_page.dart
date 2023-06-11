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
    // id를 argument로 넘겨도 되고, 위의 파라미터 int id로 받아도 됨

    UserController u = Get.find();
    PostController p = Get.find();
    print("로그인 유저아이디 : ${u.principal.value.id}");
    return Scaffold(
      appBar: AppBar( // 앱바가 있어야 뒤로가기 가능. 먼저 만들어놓을 것
          title: Text(
            "게시글 아이디 : $id, 로그인 상태 : ${u.isLogin}",
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx( // Obx에 접근만 하면 id를 굳이 넘겨받을 필요없음? (이해안감)
          () => Column(
            children: [
              Text(
                "${p.post.value.title}", // 글제목
                // value붙여야
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Divider(),
              u.principal.value.id == p.post.value.user!.id // 3항 연산자 ( 두 개 같으면 아래 row 아니면 빈 SizedBox출력)
                  ? Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await p.deleteById(p.post.value.id!); // 삭제되는 것 기다렸다가 homepage로 가야해서 await
                            Get.off(() => HomePage()); // Getoff는 페이지 이동후 뒤로가기 막는 것
                            // Get.back(); // 뒤로 돌아가고 스택에서 빼는 것
                            // 뒤로가기(Get.back), Get.to(HomePage()), Get.off 중 아무거나 써도?
                            // 상태관리로 관리할 수 있어서 상관없음?
                          },
                          child: Text("삭제"),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => UpdatePage()); // Detail페이지의 id 등 값 들고가야하지만 id는 어차피 controller에서 관리하는 거라서 안들고 갈 것 (삭제와는 다른 방식)
                            // Getoff로 막으려고 했는데 그러면 뒤로가기가 안되서 그냥 to로 둠. 상태관리로 해결할 것
                            // 같은 페이지로 덮어씌우는 게 제일 낫겠지만
                          },
                          child: Text("수정"),
                        ),
                      ],
                    )
                  : SizedBox(),
              Expanded(
                // 글 내용 길어질 수 있으므로 Scroll되도록
                // ListView로 하기엔 Child 하나밖에 없으므로 SingleChildScrollView 사용
                child: SingleChildScrollView(
                  child: Text("${p.post.value.content}"), // 글 내용
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
