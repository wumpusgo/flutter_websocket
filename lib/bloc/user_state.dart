import 'package:websocket_example/user.dart';

abstract class UserState {
  late String msg;
  late List<User> user = List.empty();

  /// {@macro ticker_state}
  UserState();
}

class UserInitial extends UserState {
  UserInitial();
}

class UsersLoading extends UserState {
  UsersLoading();
}

class UsersLoaded extends UserState {
  UsersLoaded(List<User> user) {
    this.user = user;
  }
}
