import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_task/business_logic/cubit/comment_cubit.dart';
import 'package:flutter_task/data/models/comment.dart';
import 'package:flutter_task/data/models/user.dart';
import 'package:flutter_task/presentation/widgets/circular_indector.dart';
import 'package:flutter_task/presentation/widgets/comment_item.dart';

// ignore: must_be_immutable
class CommentsScreen extends StatefulWidget {
  late int postId;
  late List<User> users;
  CommentsScreen({
    Key? key,
    required this.postId,
    required this.users,
  }) : super(key: key);

  @override
  _CommentsScreenState createState() =>
      _CommentsScreenState(postId: postId, users: users);
}

class _CommentsScreenState extends State<CommentsScreen> {
  late int postId;
  late List<Comment> allComments;
  late List<Comment> postComments;
  late List<User> users;
  late User user;

  _CommentsScreenState({required this.postId, required this.users});

  @override
  void initState() {
    super.initState();
    allComments = [];
    postComments = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<CommentCubit>(context).getAllComments();
  }

  void getPostComments() {
    postComments = [];
    allComments.forEach((element) {
      if (element.postId == postId) {
        postComments.add(element);
      }
    });
  }

  void getUserThatWriteThisComment(int userId) {
    user = users.firstWhere((element) => element.userId == userId);
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Comments",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildCommentsScreen() {
    return ListView.builder(
      itemCount: postComments.length,
      itemBuilder: (context, index) {
        getUserThatWriteThisComment(postComments[index].userId);
        return CommentItem(
          comment: postComments[index],
          user: user,
        );
      },
    );
  }

  Widget buildCommentBloc() {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        if (state is CommentsLoaded) {
          allComments = state.comments;
          getPostComments();
          return buildCommentsScreen();
        } else {
          return buildProgressIndctor();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildCommentBloc(),
    );
  }
}
