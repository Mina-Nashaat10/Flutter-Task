import 'package:flutter_task/constants/users_list.dart';
import 'package:flutter_task/data/models/user.dart';

class UserRepository {
  late List<User> users;
  UserRepository() {
    users = [];
  }
  List<User> getAllUsers() {
    users = appUsers;
    return users;
  }
}
