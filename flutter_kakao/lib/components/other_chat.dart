import 'package:flutter/material.dart';

import '../models/user.dart';

class OtherChat extends StatelessWidget {

  final String name;
  final String text;
  final String time;

  const OtherChat({required this.name, required this.text, required this.time});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(friends[0].backgroundImage),
          ),
          SizedBox(width: 10),
          Flexible( // 채팅 내용이 길 경우에 overFlow나지 않고 밑으로 내려가도록
            // Expanded로 주면 공간을 다 잡아서
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "asf"
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 5),
          Text(
            time,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
