import 'package:flutter_task/constants/posts_list.dart';
import 'package:flutter_task/data/models/post.dart';

class PostRepository {
  late List<Post> posts;
  PostRepository() {
    posts = [];
  }
  List<Post> getAllPosts() {
    posts = usersPosts;
    return usersPosts;
  }
}
