import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';

import 'package:flutter_task/data/models/comment.dart';
import 'package:flutter_task/data/models/user.dart';

// ignore: must_be_immutable
class CommentItem extends StatefulWidget {
  late Comment comment;
  late User user;
  CommentItem({
    Key? key,
    required this.comment,
    required this.user,
  }) : super(key: key);

  @override
  _CommentItemState createState() =>
      _CommentItemState(comment: comment, user: user);
}

class _CommentItemState extends State<CommentItem> {
  late Comment comment;
  late User user;
  late String commentTime;

  _CommentItemState({required this.comment, required this.user});

  void calcTimeFromPublishCommentToNow() {
    DateTime dateTime = DateTime.now();
    Duration duration = dateTime.difference(comment.dateTime);
    if (duration.inDays == 0) {
      commentTime = duration.inHours.toString() + "h";
    } else if (duration.inDays > 0 && duration.inDays < 7) {
      commentTime = duration.inDays.toString() + "d";
    } else if (duration.inDays > 7 && duration.inDays < 365) {
      commentTime = ((duration.inDays) ~/ 7).toString() + "w";
    } else {
      commentTime = ((duration.inDays) ~/ 365.25).toString() + "y";
    }
  }

  Widget buildCommentInfoWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    user.fullName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 5, 8, 8),
                  child: AutoDirection(
                    text: comment.commentContent,
                    child: Text(
                      comment.commentContent,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(9, 5, 5, 0),
            child: Text(
              commentTime,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    calcTimeFromPublishCommentToNow();
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              user.userImage,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          buildCommentInfoWidget(),
        ],
      ),
    );
  }
}
