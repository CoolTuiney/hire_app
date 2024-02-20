// To parse this JSON data, do
//
//     final userRegisterModel = userRegisterModelFromJson(jsonString);

import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) => json.encode(data.toJson());

class UserRegisterModel {
    int? code;
    String? data;
    String? message;
    int? statusCode;

    UserRegisterModel({
        this.code,
        this.data,
        this.message,
        this.statusCode,
    });

    factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
        code: json["code"],
        data: json["data"],
        message: json["message"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data,
        "message": message,
        "statusCode": statusCode,
    };
}
