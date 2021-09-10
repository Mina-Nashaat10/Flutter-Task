class Post {
  late int postId;
  late int userId;
  late String? title;
  late List<String>? postImage;
  late DateTime dateTime;
  late int likesCount;
  late int commentsCount;
  Post({
    required this.postId,
    required this.userId,
    this.title,
    this.postImage,
    required this.dateTime,
    required this.likesCount,
    required this.commentsCount,
  });

}
