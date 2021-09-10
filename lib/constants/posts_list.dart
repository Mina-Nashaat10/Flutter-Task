import 'package:flutter_task/data/models/post.dart';

List<Post> usersPosts = [
  Post(
    postId: 1,
    userId: 1,
    title:
        "Apple iPhone 13 Pro Max is the upcoming mobile from Apple that is expected to be launched in India on September 30, 2021 (Unofficial). The mobile will come with adequate specifications and decent specifications. It is rumored to be available at a starting price of Rs 80,999.",
    postImage: ["assets/images/iphone_pro_max_13.jpg"],
    dateTime: DateTime(2021, 8, 17, 3, 45),
    likesCount: 14,
    commentsCount: 3,
  ),
  Post(
    postId: 2,
    userId: 2,
    title: null,
    postImage: [
      "assets/images/salah1.jpg",
      "assets/images/salah2.jpg",
      "assets/images/salah3.jpg",
      "assets/images/salah4.jpg",
    ],
    dateTime: DateTime(2020, 4, 1, 6, 05),
    likesCount: 12,
    commentsCount: 3,
  ),
  Post(
    postId: 3,
    userId: 3,
    title:
        "اجمل حكم الحياه ----> أن تضيء شمعةً صغيرةً خير لك من أن تنفق عمرك تلعن الظلام",
    postImage: null,
    dateTime: DateTime(2021, 2, 22, 11, 27),
    likesCount: 25,
    commentsCount: 2,
  ),
  Post(
    postId: 4,
    userId: 4,
    title: "what difference between final and const ? thanks in advanced",
    postImage: null,
    dateTime: DateTime(2018, 5, 10, 10, 14),
    likesCount: 7,
    commentsCount: 1,
  ),
  Post(
    postId: 5,
    userId: 5,
    title:
        "فيروسات كورونا فصيلة واسعة الانتشار معروفة بأنها تسبب أمراضاً تتراوح من نزلات البرد الشائعة إلى الاعتلالات الأشد وطأة مثل متلازمة الشرق الأوسط التنفسية (MERS) ومتلازمة الالتهاب الرئوي الحاد الوخيم (السارس).",
    postImage: ["assets/images/corona_virus.jpg"],
    dateTime: DateTime(2019, 12, 1, 7, 32),
    likesCount: 30,
    commentsCount: 0,
  ),
];
