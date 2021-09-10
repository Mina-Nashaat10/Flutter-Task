import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/app_route.dart';
import 'package:flutter_task/business_logic/cubit/post_cubit.dart';
import 'package:flutter_task/constants/strings.dart';
import 'package:flutter_task/presentation/screens/feed_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Facebook",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: feedScreen,
    );
  }
}
