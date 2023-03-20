import 'package:flutter/material.dart';
import 'package:flutter_airebnb/size.dart';
import 'package:flutter_airebnb/styles.dart';

class HomeBodyBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m),
      child: Stack(
        children: [
          _buildBannerImage(),
          _buildBannerCaption(),
        ],
      ),
    );
  }

  Widget _buildBannerImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/banner.jpg",
        fit: BoxFit.cover,
        height: 320, // 높이 맞춰서 비율유지하면서
        width: double.infinity, // 최대 너비, 크기에 맞게 이미지 잘림
      ),
    );
  }

  Widget _buildBannerCaption() {
    return Positioned(
        top: 40,
        left: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                // Container 자체에 width를 줄 수도 있으나, 자식개체에 제한을 이렇게 주면 최소/최대값 설정할 수 있어 나음
                maxWidth: 250,
              ),
              child: Text(
                "이제, 여행은 가까운 곳에서",
                style: h4(mColor: Colors.white),
              ),
            ),
            SizedBox(height: gap_m),
            Container(
              constraints: BoxConstraints(
                maxWidth: 250,
              ),
              child: Text(
                "새로운 공간에 머물러 보세요. 살아보기, 출장, 여행 등 다양한 목적에 맞는 숙소를 찾아보세요.",
                style: subtitle1(mColor: Colors.white),
              ),
            ),
            SizedBox(
              height: gap_m,
            ),
            SizedBox(
              height: 35,
              width: 170,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onPressed: () {},
                child: Text(
                  "가까운 여행지 둘러보기",
                  style: subtitle2(),
                ),
              ),
            )
          ],
        ));
  }
}
