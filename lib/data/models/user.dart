class User {
  late int userId;
  late String fullName;
  late String userImage;
  User();
  User.withData({
    required this.userId,
    required this.fullName,
    required this.userImage,
  });
}
