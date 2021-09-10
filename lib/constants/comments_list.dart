import 'package:flutter_task/data/models/comment.dart';

List<Comment> postComments = [
  // post # 1
  Comment(
    commentId: 1,
    userId: 2,
    postId: 1,
    commentContent:
        "The iPhone 13 Pro Max is Apple's biggest phone in the lineup with a massive, 6.7 screen that for the first time in an iPhone comes with 120Hz ProMotion display that ensures super smooth scrolling. The benefit of such a gigantic phone is that it also comes with the biggest battery of all iPhone 13 series. Apple also introduces improvements to all three cameras on the Pro Max, the wide, ultra-wide and telephoto zoom ones, but there is no periscope style long-range zoom like on many Android phones.",
    dateTime: DateTime(2021, 8, 18, 7, 45),
  ),
  Comment(
    commentId: 2,
    userId: 3,
    postId: 1,
    commentContent:
        "هاتف رائع جدا وبه العديد من المميزات التي تتيح للمستخدم الارياحيه في الاستخدام حقا انه شئ جميل للغايه",
    dateTime: DateTime(2021, 8, 20, 4, 50),
  ),
  Comment(
    commentId: 3,
    userId: 4,
    postId: 1,
    commentContent: "i'm so happy",
    dateTime: DateTime(2021, 8, 22, 2, 45),
  ),

  // Post #2
  Comment(
    commentId: 4,
    userId: 1,
    postId: 2,
    commentContent:
        "Mohamed Salah Hamed Mahrous Ghaly is an Egyptian professional footballer who plays as a forward for Premier League club Liverpool and captains the Egypt national team. Considered one of the best players in the world, he is known for his finishing, dribbling, and speed.",
    dateTime: DateTime(2020, 4, 3, 3, 32),
  ),
  Comment(
    commentId: 5,
    userId: 3,
    postId: 2,
    commentContent:
        "Mohamed Salah is one of the most prolific forwards in European football and a Champions League and Premier League winner with Liverpool.",
    dateTime: DateTime(2020, 4, 5, 2, 25),
  ),
  Comment(
    commentId: 6,
    userId: 5,
    postId: 2,
    commentContent:
        "من افضل لاعبي العالم شارك في العديد من المحافل الدوليه وايضا ساهم في صعود مصر لكاس العالم عام 2018 في روسيا",
    dateTime: DateTime(2020, 4, 7, 8, 04),
  ),

  // post #3
  Comment(
    commentId: 7,
    userId: 4,
    postId: 3,
    commentContent: "حكمه جميله جدا",
    dateTime: DateTime(2021, 2, 24, 7, 14),
  ),
  Comment(
    commentId: 8,
    userId: 2,
    postId: 3,
    commentContent: "nice wisdom!!!!!!!!!!!!!!!!!!!!!!",
    dateTime: DateTime(2021, 2, 27, 2, 31),
  ),

  // post #4
  Comment(
    commentId: 9,
    userId: 2,
    postId: 4,
    commentContent: "const must be initialized in compile time and final can initialized it in compile time or run time",
    dateTime: DateTime(2018, 5, 12, 2, 31),
  ),
];
