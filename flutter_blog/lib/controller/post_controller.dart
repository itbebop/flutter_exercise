
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController{
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> findAll() async {
    //_postRepository.findAll();
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts;
  }
}