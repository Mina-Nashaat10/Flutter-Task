part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

// ignore: must_be_immutable
class UserLoaded extends UserState {
  late List<User> users;
  UserLoaded({
    required this.users,
  });
}
