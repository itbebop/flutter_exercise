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
  var refreshKey = GlobalKey<RefreshIndicatorState>(); // 데이터 상태 변경되면 동기화되도록
  //var scaffoldKey = GlobalKey<ScaffoldState>();
  final _scffoldkey = GlobalKey<ScaffoldState>();

  // void _openEndDrawer() {
  //   _scffoldkey.currentState!.openEndDrawer();
  // }
  // void _closeEndDrawer() {
  //   Navigator.of(context).pop();
  // }
  @override
  Widget build(BuildContext context) {
    UserController u = Get.put(UserController());
    //UserController u = Get.find(); // put 있으면 찾기 -> 앞에 Get.put이 없으니까 에러남 (UserController not found)
    // 객체 생성(create), 초기화 (initialize)
    PostController p = Get.put(PostController()); // put은 1) 객체생성(create) 2) initialized(onInit 함수) 두가지 기능을 함
    //p.findAll(); // 여기서 데이터 가져와서 띄워주는 게 아니라, post controller에서 onInit함수가 초기화하면서 데이터 가져옴
    /*
    findAll 호출할 때 await로 받아야 하는데
    그렇게 받으면 ( Widget build() async ) 페이지 전체를 그릴 때 지연이 생겨 UX에 좋지 않음
    방법 3가지가 있음
    방법 중 한가지는 post_controller.findAll 부분에 통신 끝나면 return하도록
    */

    return Scaffold(
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_scffoldkey.currentState == null){
            print("null이다");
          }else{
            print("null이 아니다");
          }
          if(_scffoldkey.currentState!.isDrawerOpen){
            _scffoldkey.currentState?.openEndDrawer();
          }else{
            _scffoldkey.currentState?.openDrawer();
          }

        },
        child: Icon(Icons.code),
      ),
       */
      drawer: _navigation(context),
      appBar: AppBar(
        title: Obx(() => Text("${u.isLogin}")), // Obx로 묶어야 변경을 관찰 가능한 변수가 됨(안 묶으면 변경한다고 변하진 않음)
      ),
      body: Obx( // 리스트 담기는 것 관찰
        () => RefreshIndicator(
          key: refreshKey,
          onRefresh: () async{
            await p.findAll();
          },
          child: ListView.separated(
            // ListView.builder는 구분선 없음? / ListView.separated는 구분선 O
            itemCount: p.posts.length,
            itemBuilder: (context, index) { // index 자동 생성
              return ListTile(
                onTap: () async { // List 클릭할 경우 상세페이지로 이동
                  // 이동할 때 data 받을 때까지 기다려줘야 이동할 때 오류 안뜨므로 async
                  await p.findById(p.posts[index].id!); // 1) 여기서 데이터를 받아서 반들고 
                  // null이 절대 아님,
                  // post_controller에서 id 받을때 await하므로 여기서도 기다려야 함
                  Get.to(() => DetailPage(p.posts[index].id), arguments: "arguments 속성 테스트");// 2) 여기서 화면으로 이동
                  // DetailPage의 int id null처리해줘야함
                  // 자동생성된 index를 넘김
                },
                title: Text("${p.posts[index].title}"), // 글제목
                leading: Text("${p.posts[index].id}"), // 글 제목 앞에 번호
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ),
      ),
    );
  }

  Widget _navigation(BuildContext context) { // 메소드로 추출하면 Container로 분리되는데 Widget으로 변경
    UserController u = Get.find();

    return Container(
      width: getDrawerWidth(context), // 고정값으로 하는 것보다 context에 따라 바뀌도록
      height: double.infinity,
      color: Colors.white,
      child: SafeArea( // appbar에 contents 가리지 않도록
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
                  Navigator.pop(context); // 회원정보보기에서 뒤로가기로 돌아왔을때 좌측메뉴 나와있지 않도록, 제일 위에 쌓인 context를 날려버림
                  //_scffoldkey.currentState?.openEndDrawer(); // 키로 컨트롤
                  Get.to(() => UserInfo()); // 굳이 user정보를 들고갈 필요가 없음(find하면됨)
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
                  u.logout(); // 토큰 없애고 로그인상태 false로 변경
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
              Divider(), // 구분선
            ],
          ),
        ),
      ),
    );
  }
}
