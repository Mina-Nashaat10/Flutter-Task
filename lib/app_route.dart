import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/business_logic/cubit/comment_cubit.dart';
import 'package:flutter_task/business_logic/cubit/post_cubit.dart';
import 'package:flutter_task/constants/strings.dart';
import 'package:flutter_task/presentation/screens/comments_screen.dart';
import 'package:flutter_task/presentation/screens/feed_screen.dart';
import 'package:flutter_task/presentation/widgets/comment_item.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings routeSettings) {
    String? routeName = routeSettings.name;
    switch (routeName) {
      case feedScreen:
        var index = routeSettings.arguments;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PostCubit(),
            child: index == null
                ? FeedScreen(tabIndex: 0)
                : FeedScreen(tabIndex: index as int),
          ),
        );
      case commentScreen:
        var arguments = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CommentCubit(),
            child: CommentsScreen(
                postId: arguments['postId'], users: arguments['users']),
          ),
        );
      default:
    }
  }
}
