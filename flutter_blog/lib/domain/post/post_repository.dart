import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/login_request_dto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:get/get.dart';

import '../../util/convert_utf8.dart';

// 통신 호출해서 응답받은 데이터를 가공(Json->Dart오브젝트)
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<int> deleteById(int id) async {
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    return cmRespDto.code ?? -1;
    //return cmRespDto.code!
  }

  Future<Post> findById(int id) async {
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    // dynamic converBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

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
    // print(convertUtf8ToObject(body)); 에러남. 나중에 잡을 것
    //dynamic convertBody = convertUtf8ToObject(body); // UTF-8 한글 깨짐 해결
    // print("body: ${body}");
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();

      return posts;
    } else {
      // List<Post> p = [];
      // return p;
      return <Post>[]; // 빈 배열 리턴(위보다 간편)
    }
  }
}
