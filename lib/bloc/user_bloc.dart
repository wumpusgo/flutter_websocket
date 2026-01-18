import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websocket_example/bloc/user_event.dart';
import 'package:websocket_example/bloc/user_state.dart';
import 'package:websocket_example/repositories/user_repository.dart';
import 'package:websocket_example/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(UsersLoading());
      UserRepository userRepository = UserRepository();
      var response = await userRepository.getUsers();
      // List<User> userList = User.fromMapList(respuesta);
      emit(UsersLoaded(response));
    });
  }
}
