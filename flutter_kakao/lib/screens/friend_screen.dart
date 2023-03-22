import 'package:flutter/material.dart';
import 'package:flutter_kakao/models/user.dart';

import '../components/profile_card.dart';

class FriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "친구",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          ProfileCard(user: me),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text("친구"),
                SizedBox(width: 6),
                Text("${friends.length}"),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: List.generate(
              friends.length,
              (index) => ProfileCard(user: friends[index]),
            ),
          )),
        ],
      ),
    );
  }
}
