import 'package:flutter_blog/controller/dto/loginRequestDto.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:get/get.dart';

class UserRepositroy {
  final UserProvider _userProvider = UserProvider();
  Future<String> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    print(loginReqDto.toJson());
    Response response = await _userProvider.login(loginReqDto.toJson());
    dynamic headers = response.headers;
    String token = headers["authorization"];
    return token;
  }
}
