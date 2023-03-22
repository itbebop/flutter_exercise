import 'package:flutter/material.dart';
import 'package:flutter_kakao/screens/chat_screen.dart';
import 'package:flutter_kakao/screens/friend_screen.dart';
import 'package:flutter_kakao/screens/more_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          FriendScreen(),
          ChatScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, // 선택된 아이콘도 위치 내림. 
        // 이거 true로 하면 살짝 뜨고 밑에 라벨 나오게 할 수 있음
        showUnselectedLabels: false, // 선택 안된 아이콘들 위치 살짝 내림
        currentIndex: _selectedIndex, // 선택된 아이콘이 하이라이트
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          print("선택된 번호 : $index");
          setState(() {// extends State<MainScreen> 붙이고,
            // MainScreen클래스를 StatefulWidget로 바꿔야 함
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ellipsisH),
            label: "",
          ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}


