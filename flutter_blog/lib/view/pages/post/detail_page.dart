import 'package:flutter/material.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments; // 넘길때 다이나믹타입이라 받을 때 타입을 지정해줌

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "글 제목",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Divider(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.off(
                        HomePage()); // 뒤로가기(Get.back), Get.to(HomePage()), Get.off 중 아무거나 써도?
                    // 상태관리로 관리할 수 있어서 상관없음?
                  },
                  child: Text("삭제"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.to(UpdatePage());
                  },
                  child: Text("수정"),
                ),
              ],
            ),
            Expanded(
              // 글 내용 길어질 수 있으므로 Scroll되도록
              // ListView로 하기엔 Text하나밖에 없으므로 이런 식으로 함
              child: SingleChildScrollView(
                child: Text("글 내용"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
