// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final bool? success;
  final Data? data;
  final String? message;

  LoginModel({
    this.success,
    this.data,
    this.message,
  });

  LoginModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      LoginModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  final int? userId;
  final String? apiToken;
  final String? createdAt;

  Data({
    this.userId,
    this.apiToken,
    this.createdAt,
  });

  Data copyWith({
    int? userId,
    String? apiToken,
    String? createdAt,
  }) =>
      Data(
        userId: userId ?? this.userId,
        apiToken: apiToken ?? this.apiToken,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        apiToken: json["api_token"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "api_token": apiToken,
        "created_at": createdAt,
      };
}
