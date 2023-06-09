import 'package:validators/validators.dart';

Function validateUsername() {
  return (String? value) {
    if (value!.isEmpty) {
      // 순서가 한글체크 전에 와야
      return "공백이 들어갈 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      //알파벳이나 숫자만 들어감, 한글, 특수문자 안들어감
      return "유저네임에 특수문자나 한글이 들어갈 수 없습니다.";
    } else if (value.length > 13) {
      return "유저네임은 12자를 넘을 수 없습니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    if (value!.isEmpty) {
      // 순서가 한글체크 전에 와야
      return "공백이 들어갈 수 없습니다.";
      // }else if(!isAlphanumeric(value)){ // 특수문자도 제외돼서 뺌
      //   return "패스워드에 한글이 들어갈 수 없습니다.";
    } else if (value.length > 13) {
      return "패스워드는 12자를 넘을 수 없습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      // 순서가 한글체크 전에 와야
      return "공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) { // pub.dev의 validator 문서 참고
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      // 순서가 한글체크 전에 와야
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목은 30자를 초과할 수 없습니다.";
    } else {
      return null;
    }
  };
}

Function validateContent() {
  return (String? value) {
    if (value!.isEmpty) {
      // 순서가 한글체크 전에 와야
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "내용은 500자를 초과할 수 없습니다.";
    } else {
      return null;
    }
  };
}
