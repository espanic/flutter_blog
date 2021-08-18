import 'package:get/get.dart';

const host = "http://192.168.168.145:8080";

class UserProvider extends GetConnect {
  Future<Response> login(Map data) => post("$host/login", data);
}
