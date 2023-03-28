import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/login_request_dto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:get/get.dart';

import '../../util/convert_utf8.dart';

// 통신 호출해서 응답받은 데이터를 가공(Json->Dart오브젝트)
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    // print(convertUtf8ToObject(body)); 에러남. 나중에 잡을 것
    //dynamic convertBody = convertUtf8ToObject(body); // UTF-8 한글 깨짐 해결
    // print("body: ${body}");
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1){
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();

      return posts;
    }else{
      // List<Post> p = [];
      // return p;
      return <Post>[];// 빈 배열 리턴(위보다 간편)
    }
  }
}
