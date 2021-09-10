import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_task/business_logic/cubit/post_cubit.dart';
import 'package:flutter_task/business_logic/cubit/user_cubit.dart';
import 'package:flutter_task/constants/strings.dart';
import 'package:flutter_task/data/models/post.dart';
import 'package:flutter_task/presentation/widgets/circular_indector.dart';
import 'package:flutter_task/presentation/widgets/post_item.dart';

// ignore: must_be_immutable
class FeedScreen extends StatefulWidget {
  late int tabIndex;

  FeedScreen({
    Key? key,
    required this.tabIndex,
  }) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState(tabIndex: tabIndex);
}

class _FeedScreenState extends State<FeedScreen> {
  late List<Post> posts;
  late int tabIndex;
  _FeedScreenState({required this.tabIndex});
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<PostCubit>(context).getAllPosts();
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "facebook",
        style: TextStyle(
          color: Colors.blue.shade700,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
      ),
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.blue.shade700,
          ), // set your color here
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Image.asset(
            "assets/images/facebook-messenger.png",
          ),
        ),
      ],
      bottom: TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.video_library,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.games,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.app_settings_alt_sharp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeedBody() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return BlocProvider(
            create: (context) => UserCubit(),
            child: PostItem(
              post: posts[index],
            ),
          );
        },
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is PostLoaded) {
          posts = state.posts;
          return buildFeedBody();
        } else {
          return buildProgressIndctor();
        }
      },
    );
  }

  Widget buildFeedScreenDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/facebook-drawer-header.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                feedScreen,
                arguments: 0,
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.video_library,
              color: Colors.black,
            ),
            title: Text(
              "Videos",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                feedScreen,
                arguments: 1,
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
            title: Text(
              "Shopping",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                feedScreen,
                arguments: 2,
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.games,
              color: Colors.black,
            ),
            title: Text(
              "Games",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                feedScreen,
                arguments: 3,
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.app_settings_alt_sharp,
              color: Colors.black,
              size: 28,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                feedScreen,
                arguments: 4,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: tabIndex,
      child: Scaffold(
        appBar: buildAppBar(),
        drawer: buildFeedScreenDrawer(),
        body: TabBarView(children: [
          buildBlocWidget(),
          Center(
            child: Text(
              "Facebook Videos",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Center(
            child: Text(
              "Facebook Shoping",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Center(
            child: Text(
              "Facebook Games",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Center(
            child: Text(
              "Facebook Settings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
