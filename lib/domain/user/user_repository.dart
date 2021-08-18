import 'package:flutter_blog/controller/dto/CMrespDto.dart';
import 'package:flutter_blog/controller/dto/loginRequestDto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    print(loginReqDto.toJson());
    Response response = await _userProvider.login(loginReqDto.toJson());
    print("response.body ${response.body}");
    dynamic headers = response.headers;
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);

    if (cmRespDto.code == 1) {
      User principal = User.fromJson(cmRespDto.data);
      String token = headers["authorization"];
      jwtToken = token;

      return principal;
    } else {
      return User();
    }
    // if (headers["authorization"] == null) {
    //   return "-1";
    // } else {
    //   String token = headers["authorization"];
    //   return token;
    // }
  }
}
