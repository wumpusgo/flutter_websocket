abstract class UserState {
  late String msg;
  late List<String> user = List.empty();

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
  UsersLoaded(List<String> user) {
    this.user = user;
  }
}
