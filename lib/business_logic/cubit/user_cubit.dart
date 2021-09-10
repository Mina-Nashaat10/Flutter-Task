import 'package:bloc/bloc.dart';
import 'package:flutter_task/data/models/user.dart';
import 'package:flutter_task/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  late UserRepository userRepository;
  late List<User> users;
  UserCubit() : super(UserInitial()) {
    userRepository = UserRepository();
    users = [];
  }

  List<User> getAllUsers() {
    users = userRepository.getAllUsers();
    emit(UserLoaded(users: users));
    return users;
  }
}
