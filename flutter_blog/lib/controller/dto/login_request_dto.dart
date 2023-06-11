class LoginReqDto {
  final String? username;
  final String? password;

  LoginReqDto(this.username, this.password); //무조건 받을 것

  Map<String, dynamic> toJson() => { // User Repository에서 사용
        "username": username,
        "password": password,
      };
}
