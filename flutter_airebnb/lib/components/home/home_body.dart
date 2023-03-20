import 'package:flutter/material.dart';
import 'package:flutter_airebnb/components/home/home_body_banner.dart';
import 'package:flutter_airebnb/components/home/home_body_popular.dart';
import 'package:flutter_airebnb/size.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bodyWidth = getBodyWidth(context);
    print("bodyWidth : $bodyWidth");

    double screenWidth = MediaQuery.of(context).size.width;

    return Align(
      // Align으로 Sizedbox를 감싸서 ListView-SizedBox에 최대 넓이 제약조건 주는 고리 끊음
      // default 정렬이 가운데 정렬
      child: SizedBox(
        width: screenWidth < 420
            ? double.infinity
            : bodyWidth, // 420보다 사이즈 작아지면 여백없앰
        child: Column(
          children: [
            HomeBodyBanner(),
            HomeBodyPopular(),
          ],
        ),
      ),
    );
  }
}
