
import 'package:flutter/material.dart';

class HomeHeaderForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-0.6, 0), // -1.0 ~ 1.0 범위를 가진다 (가로, 세로)
      child: Container(
        width: 420,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          child: Column(
            children: [
              Text("에어비엔비에서 숙소를 검색하세요"),
            ],
          ),
        ),
      ),
    );
  }
}
