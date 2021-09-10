part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

// ignore: must_be_immutable
class PostLoaded extends PostState {
  late List<Post> posts;
  PostLoaded({
    required this.posts,
  });
}
