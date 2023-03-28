import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

//const host = "http://192.168.219.125:8080"; // ip
const host = "http://10.65.81.183:8080"; // ip

// 통신 역할
class PostProvider extends GetConnect {
  Future<Response> findAll() => get("$host/post", headers: {"Authorization" : jwtToken ?? ""});
// login 실행하면 post가 실행되는데 post는 Get이 들고 있는 함수, map타입으로 data에 파라미터 날릴 것
// Future는 함수 실행되는데 시간이 좀 걸리므로 바로는 Null이 들어오지만 시간이 좀 걸려서 데이터 들어오면 바꿔줌 (Promise, 데이터 약속)
}
