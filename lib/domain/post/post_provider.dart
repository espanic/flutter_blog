import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://172.20.27.140:8080";

class PostProvider extends GetConnect {
  Future<Response> findAll() =>
      get("$host/post", headers: {"authorization": jwtToken ?? ""});
  Future<Response> findById(int id) =>
      get("$host/post$id", headers: {"authorization": jwtToken ?? ""});

  Future<Response> deleteById(int id) =>
      delete("$host/post$id", headers: {"authorization": jwtToken ?? ""});

  Future<Response> updateById(int id, Map data) =>
      put("$host/post$id", data, headers: {"authorization": jwtToken ?? ""});
}
