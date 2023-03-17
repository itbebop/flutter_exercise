import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shioppingcart/constants.dart';

class   ShoppingCartDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            _buildDetailNameAndPrice(),
            _buildDetailRatingAndReviewCount(),
            _buildDetailColorOptions(),
            _buildDetailButton(context)
          ],
        ),
      ),
    );
  }
  Widget _buildDetailNameAndPrice(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Urban Soft AL 10.0", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("\$699", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
  Widget _buildDetailRatingAndReviewCount(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Spacer(),
          Text("review "),
          Text(
              "(26)",
              style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
  Widget _buildDetailColorOptions(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Color Options"),
          SizedBox(height: 10),
          Row(
            children: [
              _buildDetailIcons(Colors.black),
              _buildDetailIcons(Colors.green),
              _buildDetailIcons(Colors.orange),
              _buildDetailIcons(Colors.grey),
              _buildDetailIcons(Colors.white),
            ],
          ),
        ],
      ),
    );
  }
  // Stack 위젯
  Widget _buildDetailIcons(Color mColor){
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              //borderRadius: BorderRadius.circular(25)
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            // 가운데 규칙 : (외부크기 - 내부크기) / 2
            left: 5,
            top: 5,
            child: ClipOval(
              // ClipOval은 위젯이 모양이 잡을 수 있는 속성이 없을 때 사용
              child: Container(
                  color: mColor,
                  width: 40,
                  height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildDetailButton(BuildContext context){
    return TextButton(
        onPressed: () {
          showCupertinoDialog(context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text("장바구니에 담으시겠습니까?"),
              actions: [
                CupertinoDialogAction(
                  child: Text("확인"),
                  onPressed: () {
                    print("장바구니에 담김");
                    Navigator.pop(context);
                  },
                )
              ],

            ),
          );
        },
        child: Text(
            "Add to Cart",
            style: TextStyle(color: Colors.white),
        ),
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: Size(300, 50),
          shape: RoundedRectangleBorder( // 꼭 기억할 것
            borderRadius: BorderRadius.circular(20),
          )
        )
    );
  }
}
