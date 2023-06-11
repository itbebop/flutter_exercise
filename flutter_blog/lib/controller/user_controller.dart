import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController { // get.find로 어디에서는 controller에 접근할 수 있음 -> 아이디, 토큰 등 받을 수 있음
  final UserRepository _userRepository =
      UserRepository(); // final 다음 타입 생략해도 가능.
  final RxBool isLogin = false.obs; // RxBool : UI가 관찰 가능한 변수 (변수가 변경되면 UI가 자동 업데이트됨)
  final principal = User().obs; // 이것도 마찬가지로 .obs를 붙여서 관찰 가능한 변수로 만듬, 값이 변하면 자동 업데이트 되므로 update() 필요없음

  void logout() {
    isLogin.value = false;
    jwtToken = null;
  }

  Future<int> login(String username, String password) async {
    User principal = await _userRepository.login(username, password); // userRepository의 login 메소드 호출해서 token받는데, login 메소드도 async이므로 여기서도 기다려야함
    // shared preferrence?라는 데 저장하면 앱 꺼져도 저장되는데, 여기서는 파일(jwt.dart) 에 저장할 것
    // userRepository와 통신하여 principal에 토큰 받아옴
    print("user principal : $principal");
    if (principal.id != null) {
      isLogin.value = true; // isLogin 변수는 여기 하나밖에 없어서 this.써도 되지만 필요없는 코드라고 나옴
      this.principal.value = principal;
      return 1;
    } else { // repository에서 빈 객체를 받은 경우
      return -1;
    }
  }
}
