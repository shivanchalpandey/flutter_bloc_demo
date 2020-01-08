import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_demo_bloc_example/retrofit_client/user_details_client.dart';

class UserRepository {
  static final UserRepository _singletonUserRepository =
      UserRepository._internal();

  factory UserRepository() {
    return _singletonUserRepository;
  }

  UserRepository._internal();

  Future<dynamic> userInfo(int page) async {
    return await UserDetailsClient(Dio()).getUserDetail(page);
  }
}
