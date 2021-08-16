import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

final UserRepository _userRepository = UserRepository();

class UserController extends GetxController {
  Future<void> login(String username, String password) async {
    String token = await _userRepository.login(username, password);
    jwtToken = token;
    print("jwtToken: $jwtToken");
  }
}
