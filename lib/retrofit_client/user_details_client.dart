import 'package:dio/dio.dart';
import 'package:flutter_demo_bloc_example/constants/url_constant.dart';
import 'package:flutter_demo_bloc_example/model/network/user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'user_details_client.g.dart';

@RestApi(baseUrl: "")
abstract class UserDetailsClient {
  factory UserDetailsClient(Dio dio) = _UserDetailsClient;

  @GET(UrlConstant.BASE_URL + UrlConstant.USER_DETAILS)
  Future<UserModel> getUserDetail(@Query("page") int page);
}
