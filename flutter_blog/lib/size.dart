import 'package:flutter/cupertino.dart';

double getScreenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
  // MediaQuery => width 재주는 함수
}

double getDrawerWidth(BuildContext context){
  return getScreenWidth(context) * 0.6;
}