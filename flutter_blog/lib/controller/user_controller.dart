import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository =
      UserRepository(); // final 다음 타입 생략해도 가능.
  final RxBool isLogin =
      false.obs; // RxBool : UI가 관찰 가능한 변수 (변수가 변경되면 UI가 자동 업데이트됨)
  final principal = User().obs;

  void logout() {
    this.isLogin.value = false;
    jwtToken = null;
  }

  Future<int> login(String username, String password) async {
    // 앞에서 기다리므로 여기서도 기다려야함
    User principal = await _userRepository.login(username, password);
    print(principal);
    if (principal.id != null) {
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }
}
