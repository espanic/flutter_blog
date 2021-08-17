import 'package:flutter_blog/controller/dto/loginRequestDto.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get.dart';

class PostRepository {
  final PostProvider _postProvider = PostProvider();
  Future<void> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    convertUtf8ToObject(body);
    print(body);
  }
}
