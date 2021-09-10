import 'package:bloc/bloc.dart';
import 'package:flutter_task/data/models/comment.dart';
import 'package:flutter_task/data/repository/comment_repository.dart';
import 'package:meta/meta.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  late CommentRepository commentRepository;
  late List<Comment> comments;
  CommentCubit() : super(CommentInitial()) {
    commentRepository = CommentRepository();
    comments = [];
  }
  List<Comment> getAllComments() {
    comments = commentRepository.getAllComments();
    emit(CommentsLoaded(comments: comments));
    return comments;
  }
}
