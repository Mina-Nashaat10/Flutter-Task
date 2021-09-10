class Comment {
  late int commentId;
  late int userId;
  late int postId;
  late String commentContent;
  late DateTime dateTime;
  Comment({
    required this.commentId,
    required this.userId,
    required this.postId,
    required this.commentContent,
    required this.dateTime,
  });
}
