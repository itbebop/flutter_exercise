import 'package:flutter/material.dart';
import 'package:flutter_airebnb/components/home/home_body_popular_item.dart';
import 'package:flutter_airebnb/size.dart';
import 'package:flutter_airebnb/styles.dart';

class HomeBodyPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m),
      child: Column(
        children: [_buildPopularTitle(), _buildPopularList()],
      ),
    );
  }

  Widget _buildPopularTitle() {
    return SizedBox(
      width: double.infinity, // 아래 Column이 작아서 crossAxis.. 가 안먹어서 늘려줌
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "한국 숙소에 직접 다녀간 게스트의 후기",
            style: h5(),
          ),
          Text(
            "게스트 후기 2,500,000개 이상, 평균 평점 4.7(5점 만점)",
          ),
          SizedBox(
            height: gap_m,
          )
        ],
      ),
    );
  }

  Widget _buildPopularList() {
    // HomeBodyPopularItem 3개 들어갈 것
    return Wrap(
      // 비율 줄이면 아래로 흘러감
      children: [
        HomeBodyPopularItem(id: 0),
        SizedBox(width: 7.5),
        HomeBodyPopularItem(id: 1),
        SizedBox(width: 7.5),
        HomeBodyPopularItem(id: 2),
      ],
    );
  }
}
