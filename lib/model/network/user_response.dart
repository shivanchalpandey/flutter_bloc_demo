// To parse this JSON data, do
//
//     final userResponseModel = userResponseModelFromJson(jsonString);
//
//import 'dart:convert';
//
//class UserResponseList{
//  final List<UserResponseModel> userResponseList;
//
//  UserResponseList({
//    this.userResponseList,
//  });
//
//  factory UserResponseList.fromJson(List<dynamic> parsedJson) {
//
//    List<UserResponseModel> userResponseList = new List<UserResponseModel>();
//    userResponseList = parsedJson.map((i)=>UserResponseModel.fromJson(i)).toList();
//
//    return new UserResponseList(
//        userResponseList: userResponseList
//    );
//  }
//
//
//}
//
//class UserResponseModel {
//  int postId;
//  int id;
//  String name;
//  String email;
//  String body;
//
//  UserResponseModel({
//    this.postId,
//    this.id,
//    this.name,
//    this.email,
//    this.body,
//  });
//
//  factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
//    postId: json["postId"],
//    id: json["id"],
//    name: json["name"],
//    email: json["email"],
//    body: json["body"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "postId": postId,
//    "id": id,
//    "name": name,
//    "email": email,
//    "body": body,
//  };
//}

import 'package:flutter_demo_bloc_example/model/network/user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserModel {
  int page;
  @JsonKey(name: "per_page")
  int perPage;
  int total;
  @JsonKey(name: "total_pages")
  int totalPages;
  List<UserData> data;

  UserModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
