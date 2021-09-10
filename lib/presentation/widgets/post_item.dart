import 'package:auto_direction/auto_direction.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/business_logic/cubit/comment_cubit.dart';
import 'package:flutter_task/business_logic/cubit/user_cubit.dart';
import 'package:flutter_task/constants/strings.dart';
import 'package:flutter_task/data/models/comment.dart';
import 'package:flutter_task/data/models/post.dart';
import 'package:flutter_task/data/models/user.dart';
import 'package:flutter_task/presentation/screens/comments_screen.dart';
import 'package:flutter_task/presentation/widgets/circular_indector.dart';

// ignore: must_be_immutable
class PostItem extends StatefulWidget {
  late Post post;
  PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState(post: this.post);
}

class _PostItemState extends State<PostItem> {
  late List<User> users;
  late Post post;
  late User user;
  bool isLiked = false;
  _PostItemState({required this.post});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<UserCubit>(context).getAllUsers();
  }

  User getUserInfo(int id) {
    User user = User();
    users.forEach((element) {
      if (element.userId == id) {
        user = element;
      }
    });
    return user;
  }

  String getPostMinute() {
    if (post.dateTime.minute.toString().length == 1) {
      return "0" + post.dateTime.minute.toString();
    } else {
      return post.dateTime.minute.toString();
    }
  }

  String changeDateTimeToString(DateTime dateTime) {
    String dateTimeStr = post.dateTime.year.toString() +
        "/" +
        post.dateTime.month.toString() +
        "/" +
        post.dateTime.day.toString() +
        " " +
        post.dateTime.hour.toString() +
        ":" +
        getPostMinute();
    return dateTimeStr;
  }

  Widget buildPostText() {
    if (post.title == null) {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: AutoDirection(
          text: post.title.toString(),
          child: ExpandableText(
            post.title.toString(),
            expandText: 'show more',
            collapseText: 'show less',
            maxLines: 2,
            linkColor: Colors.blue,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ),
      );
    }
  }

  Widget buildPostImages() {
    Widget widget;
    if (post.postImage == null) {
      widget = Container();
    } else if (post.postImage?.length == 1) {
      widget = Container(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Image.asset(
          post.postImage![0],
          fit: BoxFit.cover,
        ),
      );
    } else {
      widget = Container(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: CarouselSlider(
          items: post.postImage?.map((e) => Image.asset(e)).toList(),
          options: CarouselOptions(
            autoPlay: false,
            scrollDirection: Axis.horizontal,
            aspectRatio: 1.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
        ),
      );
    }
    return widget;
  }

  Widget buildLikesAndCommentsCount() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        children: [
          Image.asset(
            "assets/images/facebook-like.png",
            height: 20,
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            post.likesCount.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          Spacer(),
          Text(
            post.commentsCount.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "comments",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLikeAndCommentWidgets() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                if (isLiked == false) {
                  post.likesCount++;
                  isLiked = true;
                } else {
                  post.likesCount--;
                  isLiked = false;
                }
              });
            },
            child: Text("Like"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                isLiked == true ? Colors.blue : Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                commentScreen,
                arguments: {"postId": post.postId, "users": users},
              );
            },
            child: Text("Comment"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPostItem() {
    user = getUserInfo(post.userId);
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 7, 7, 7),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    user.userImage,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      changeDateTimeToString(post.dateTime).toString(),
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Save Post"),
                    ),
                    PopupMenuItem(
                      child: Text("Hide Post"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          buildPostText(),
          buildPostImages(),
          buildLikesAndCommentsCount(),
          buildLikeAndCommentWidgets(),
        ],
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          users = (state).users;
          return buildPostItem();
        } else {
          return buildProgressIndctor();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildBlocWidget();
  }
}
