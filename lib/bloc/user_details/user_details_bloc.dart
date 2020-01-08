import 'package:bloc/bloc.dart';
import 'package:flutter_demo_bloc_example/bloc/user_details/user_details_event.dart';
import 'package:flutter_demo_bloc_example/bloc/user_details/user_details_state.dart';
import 'package:flutter_demo_bloc_example/model/network/user_response.dart';
import 'package:flutter_demo_bloc_example/repository/user_repository.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserRepository userRepository = UserRepository();

  @override
  UserDetailsState get initialState {
    return UserDetailsInitialState();
  }

  @override
  Stream<UserDetailsState> mapEventToState(UserDetailsEvent event) async* {
    if (event is FetchUserDetailsEvent) {
      yield UserDetailsLoading();
      try {
        UserModel userResponseList = await userRepository.userInfo(event.page);
        yield UserDetailsSuccessState(userResponseList, event.page);
        print(userResponseList);
      } catch (e) {
        print("error msg ${e.toString()}");
        yield UserDetailsFailed(e);
      }
    }
  }
}
