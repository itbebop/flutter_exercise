import 'package:flutter/material.dart';
import 'package:flutter_kakao/screens/profile_screen.dart';

import '../models/user.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(user: me),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 20, // 크기
          backgroundImage: NetworkImage(
            user.backgroundImage,
          ),
        ),
        title: Text(user.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          user.intro,
          style: TextStyle(fontSize: 12),
        ),
        //contentPadding: EdgeInsets.all(0), //왼쪽으로 붙이기
      ),
    );
  }
}
