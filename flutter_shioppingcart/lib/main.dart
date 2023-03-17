import 'package:flutter/material.dart';
import 'package:flutter_shioppingcart/components/shoppingcart_detail.dart';
import 'package:flutter_shioppingcart/components/shoppingcart_header.dart';

import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
        color: Colors.white,)
      ),
      //theme: theme(),
      home: ShoppingCartPage(),
    );
  }
}
class ShoppingCartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: Column(
        children: [
          ShoppingCartHeader(),
          Expanded(child: ShoppingCartDetail()),
        ],
      ),
    );
  }

  AppBar _buildShoppingCartAppBar() {
    //AppBar(backgroundColor: Colors.red);
    return AppBar(
      elevation: 0.0,
      //leading: Icon(Icons.arrow_back),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          print("클릭함");
        },
        color: Colors.black,
      ),
      actions: [
        IconButton(
            onPressed: (){
              print("클릭함");
            },
            color: Colors.black,
            icon: Icon(Icons.shopping_cart)),
        SizedBox(
          width: 16.0,
        )
      ],
    );
  }
}

