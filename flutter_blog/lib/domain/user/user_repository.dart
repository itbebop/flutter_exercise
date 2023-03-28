import 'package:flutter_blog/controller/dto/login_request_dto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:get/get.dart';

import '../../controller/dto/CMRespDto.dart';
import '../../util/jwt.dart';

// 통신 호출해서 응답받은 데이터를 가공(Json->Dart오브젝트)
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);

    Response response = await _userProvider.login(loginReqDto.toJson());
    dynamic headers = response.headers;
    dynamic body = response.body;

    // dynamic converBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      User principal = User.fromJson(cmRespDto.data);

      String token = headers["authorization"];

      jwtToken = token;
      print("jwtToken : $jwtToken");

      return principal;
    } else {
      return User();
    }
    //print("사용자 정보 : $body");

    /*
    if (headers["authorization"] == null) {
      return "-1";
    } else {
      String token = headers["authorization"];
      return token;
    }
    */

    /*
    print("====================");
    print(loginReqDto.toJson());
    print("====================");
    print(response.body);
    print("====================");
    print(response.headers);
     */
  }
}
