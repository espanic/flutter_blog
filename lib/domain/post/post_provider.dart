import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://172.20.27.140:8080";

class PostProvider extends GetConnect {
  Future<Response> findAll() =>
      get("$host/post", headers: {"authorization": jwtToken ?? ""});
  Future<Response> findById(int id) =>
      get("$host/post$id", headers: {"authorization": jwtToken ?? ""});
}
