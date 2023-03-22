import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;

  const RoundIconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("클릭됨");
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle, // 둥글게 하는거 clipoval도 있고 circular?도 있음
          border: Border.all(width: 1, color: Colors.white),
        ),
        child: Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
