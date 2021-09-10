import 'package:flutter_task/constants/comments_list.dart';
import 'package:flutter_task/data/models/comment.dart';

class CommentRepository {
  late List<Comment> comments;
  CommentRepository() {
    comments = [];
  }
  List<Comment> getAllComments() {
    comments = postComments;
    return comments;
  }
}
