import 'package:get/get.dart';

const host = "http://172.20.27.140:8080";

class UserProvider extends GetConnect {
  Future<Response> login(Map data) => post("$host/login", data);
}
