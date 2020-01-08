import 'package:flutter_demo_bloc_example/model/network/user_response.dart';

abstract class UserDetailsEvent {
  const UserDetailsEvent();
}

class FetchUserDetailsEvent extends UserDetailsEvent {
  int page;

  FetchUserDetailsEvent(this.page);
}

class ResetUserDetailsEvent extends UserDetailsEvent {
  UserModel userModelResponse;
  int page;

  ResetUserDetailsEvent(this.userModelResponse, this.page);
}
