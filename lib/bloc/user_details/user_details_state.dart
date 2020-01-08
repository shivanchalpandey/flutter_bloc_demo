import 'package:flutter_demo_bloc_example/model/network/user_response.dart';

class UserDetailsState {}

class UserDetailsInitialState extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsSuccessState extends UserDetailsState {
  UserModel userResponse;
  int page;

  UserDetailsSuccessState(this.userResponse, this.page);
}

class UserDetailsFailed extends UserDetailsState {
  Error e;

  UserDetailsFailed(this.e);
}
