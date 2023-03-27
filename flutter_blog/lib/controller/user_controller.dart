import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();

  Future<void> login(String username, String password) async {
    // 앞에서 기다리므로 여기서도 기다려야함
    String token = await _userRepository.login(username, password);
    jwtToken = token;
  }
}
