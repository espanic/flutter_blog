import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

final UserRepositroy _userRepositroy = UserRepositroy();

class UserController extends GetxController {
  Future<void> login(String username, String password) async {
    String token = await _userRepositroy.login(username, password);
    jwtToken = token;
    print("jwtToken: $jwtToken");
  }
}
