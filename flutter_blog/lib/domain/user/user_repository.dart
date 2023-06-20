import 'package:flutter_blog/controller/dto/login_request_dto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get.dart';

import '../../controller/dto/cm_resp_dto.dart';
import '../../util/jwt.dart';

// 통신 호출해서 응답받은 데이터를 가공(Json->Dart오브젝트)
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async { // 우선 Future<void>로 만들고 호출하는 데 맞춰서 타입 정해줌 => UserController에서 호출
    //dto (Data Transform Object)
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    // username과 password를 아래에서 넣기위해 loginReqDto (=dart클래스 오브젝트) => 아래 userProvider로 map타입으로 변환
    Response response = await _userProvider.login(loginReqDto.toJson());// username과 password를 받아서 map타입으로 넣는 것 => user_provider의 data에 넣어서 post로 보냄
    print("response : $response");
    dynamic headers = response.headers; // 토큰 받기 위해서
    dynamic body = response.body; // id 받기 위해서(detail페이지에서 만든 사람만 삭제/수정버튼 보이도록)
    dynamic converBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) { // 통신 성공
      User principal= User.fromJson(cmRespDto.data); // 한건이라 list로 바꿔줄 필요 없음

      String token = headers["authorization"];
      jwtToken = token;
      print("jwtToken : $jwtToken");

      return principal;
    } else {
      return User();// 빈 User객체를 리턴
    }
    /* header만 받다가 body 받으면서 윗부분 추가하고 주석처리
    print("headers : $headers");
    print("body : $body");
    //dynamic converBody = convertUtf8ToObject(body);
    //CMRespDto cmRespDto = CMRespDto.fromJson(converBody);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1 ) {
      User principal = User.fromJson(cmRespDto.data);

      String token = headers["authorization"];

      jwtToken = token;
      print("jwtToken : $jwtToken");

      return principal;
    } else {
      return User();
    }
    //print("사용자 정보 : $body");
    */
    /*
    if (headers["authorization"] == null) { // 서버에서 응답이 없는 경우
      return "-1"; // Future는 null을 리턴하지 못함!!! <------- 숙지
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
