import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> deleteById(int id) async {
    int result = await _postRepository.deleteById(id);

    if (result == 1) {
      print("서버 삭제 성공");
      List<Post> result = posts.where((post) => post.id != id).toList();
      print(result.length);
      posts.value = result;
    }
  }

  Future<void> findAll() async {
    //_postRepository.findAll();
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts;
  }

  Future<void> findById(int id) async {
    Post post = await _postRepository.findById(id);
    this.post.value = post;
  }
}
