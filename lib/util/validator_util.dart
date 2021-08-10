import 'package:validators/validators.dart';

Function validateUsername() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      return "유저 네임은 알파벳과 숫자만 가능합니다.";
    } else if (value.length > 12) {
      return "길이를 초과했습니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    if (value!.isEmpty) {
      return "비밀번호를 입력해주십시오.";
    } else if (!isAlphanumeric(value)) {
      return "비밀번호는 알파벳과 숫자만 가능합니다.";
    } else if (value.length > 12) {
      return "길이를 초과했습니다.";
    } else if (value.length < 4) {
      return "비밀번호는 4자 이상 입력해야됩니다.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) {
      return "Email 형식이 아닙니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목이 너무 깁니다. 30자 이하로 쓰세요.";
    } else {
      return null;
    }
  };
}

Function validateContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "글 분량을 초과했습니다. 500자 이하";
    } else {
      return null;
    }
  };
}
