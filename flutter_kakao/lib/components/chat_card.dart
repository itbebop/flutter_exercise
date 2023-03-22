import 'package:flutter/material.dart';

import '../models/chat.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;

  const ChatCard({required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              // Row에 ListTile이 들어와서 높이는 잡히는데 넓이가 Row에 자동으로 안잡혀서 안나옴.Expanded로 넓이 잡아줌
              child: ListTile(
                contentPadding:
                    EdgeInsets.all(0), // ListTile이 여백이 기본적으로 있어서 없애줌
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(chat.image),
                ),
                title: Text(
                  chat.title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                subtitle: Text(chat.content),
              ),
            ),
            Column(
              children: [
                Text(
                  chat.time,
                  style: TextStyle(
                    color: Color(0xFFa5a5a5),
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                chat.count != "0"
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFde6344),
                        ),
                        child: Text(
                          chat.count,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
