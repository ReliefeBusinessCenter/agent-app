import 'package:app/model/broker/user.dart';
import 'package:app/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetUserByPhone) {
      yield* _getUser(event.phone);
    } else if (event is UpdateUser) {
      yield* _updateUser(event.user);
    }
  }

  // when getUserByPhoneIs Called
  Stream<UserState> _getUser(String phone) async* {
    try {
      final user = await userRepository.getUserByPhone(phone);
      print("u at bloc is ${user}");
      if (user != null) {
        print("it is not null");

        yield UserSuccess(data: user);
      } else {
        print("have Error");
        yield UserError(error: "Unable to fetch user");
      }
    } catch (e) {
      print("have Error: ${e.toString()}");
      yield UserError(error: e.toString());
    }
  }

  // when update user is called
  Stream<UserState> _updateUser(User user) async* {
    yield UserLoading();
    try {
      final updateResponse = await userRepository.updateUser(user);
      if (updateResponse) {
        yield UserSuccess(data: updateResponse);
      } else {
        yield UserError(error: "unable to update user");
      }
    } catch (e) {
      yield UserError(error: e.toString());
    }
  }
}
