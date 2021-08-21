import 'package:flutter_blog/controller/dto/CMrespDto.dart';
import 'package:flutter_blog/controller/dto/Update_requ_dto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get.dart';

class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<void> updateById(int id, String title, String content) async {
    UpdateReqDto updateReqDto = UpdateReqDto(title, content);
    Response response =
        await _postProvider.updateById(id, updateReqDto.toJson());
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    if (cmRespDto.code == 1) {
      print("수정 성공");
    } else {
      print("수정실패");
    }
  }

  Future<int> deleteById(int id) async {
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    return cmRespDto.code!;
  }

  Future<Post> findById(int id) async {
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);

    if (cmRespDto.code == 1) {
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      return Post();
    }
  }

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    // print(cmRespDto.code);
    // print(cmRespDto.msg);
    // print(cmRespDto.data);
    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[];
    }
  }
}
