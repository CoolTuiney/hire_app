// To parse this JSON data, do
//
//     final userRegisterResModel = userRegisterResModelFromJson(jsonString);

import 'dart:convert';

UserRegisterResModel userRegisterResModelFromJson(String str) =>
    UserRegisterResModel.fromJson(json.decode(str));

String userRegisterResModelToJson(UserRegisterResModel data) =>
    json.encode(data.toJson());

class UserRegisterResModel {
  int? code;
  Data? data;
  String? message;
  int? statusCode;

  UserRegisterResModel({
    this.code,
    this.data,
    this.message,
    this.statusCode,
  });

  factory UserRegisterResModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterResModel(
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
        "statusCode": statusCode,
      };
}

class Data {
  int? umId;
  String? fullName;
  String? emailId;
  String? password;
  String? mobileNo;
  String? token;

  Data({
    this.umId,
    this.fullName,
    this.emailId,
    this.password,
    this.mobileNo,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        umId: json["umId"],
        fullName: json["fullName"],
        emailId: json["emailId"],
        password: json["password"],
        mobileNo: json["mobileNo"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "umId": umId,
        "fullName": fullName,
        "emailId": emailId,
        "password": password,
        "mobileNo": mobileNo,
        "token": token,
      };
}
