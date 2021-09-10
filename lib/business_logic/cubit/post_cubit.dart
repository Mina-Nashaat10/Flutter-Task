import 'package:bloc/bloc.dart';
import 'package:flutter_task/data/models/post.dart';
import 'package:flutter_task/data/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  late PostRepository postRepository;
  late List<Post> posts;
  PostCubit() : super(PostInitial()) {
    postRepository = PostRepository();
    posts = [];
  }

  Future<List<Post>> getAllPosts() async {
    await Future.delayed(Duration(seconds: 2), () {
      posts = postRepository.getAllPosts();
      emit(PostLoaded(posts: posts));
    });
    return posts;
  }
}
