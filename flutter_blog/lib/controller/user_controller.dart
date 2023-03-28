import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository(); // final 다음 타입 생략해도 가능.
  final RxBool isLogin = false.obs; // RxBool : UI가 관찰 가능한 변수 (변수가 변경되면 UI가 자동 업데이트됨)

  void logout(){
    isLogin.value = false;
    jwtToken = null;
  }
  Future<String> login(String username, String password) async {
    // 앞에서 기다리므로 여기서도 기다려야함
    String token = await _userRepository.login(username, password);
    if(token != "-1"){
      isLogin.value = true;
      jwtToken = token;
      print("jwtToken : $jwtToken");
    }

    return token;
  }
}
