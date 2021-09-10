part of 'comment_cubit.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

// ignore: must_be_immutable
class CommentsLoaded extends CommentState {
  late List<Comment> comments;
  CommentsLoaded({
    required this.comments,
  });
  
}
