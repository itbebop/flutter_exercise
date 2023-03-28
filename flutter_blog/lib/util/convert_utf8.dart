
import 'dart:convert';

dynamic convertUtf8ToObject(dynamic body){

  //jsonDecode(utf8.decode(body.codeUnits));
  // 위와 같이 쓰고 싶은데 body가 codeUnits을 안 들고 있음

  String responseBody = jsonEncode(body); // json 데이터로 변경
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  return convertBody;
}