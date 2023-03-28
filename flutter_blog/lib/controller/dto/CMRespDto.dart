
class CMRespDto {
  final int? code;
  final String? msg;
  final dynamic data;

  CMRespDto({this.code, this.msg, this.data});

  CMRespDto.fromJson(Map<String, dynamic> json) // 이름 있는 생성자
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}
