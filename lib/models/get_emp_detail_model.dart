// To parse this JSON data, do
//
//     final getEmployeeDetailModel = getEmployeeDetailModelFromJson(jsonString);

import 'dart:convert';

GetEmployeeDetailModel getEmployeeDetailModelFromJson(String str) =>
    GetEmployeeDetailModel.fromJson(json.decode(str));

String getEmployeeDetailModelToJson(GetEmployeeDetailModel data) =>
    json.encode(data.toJson());

class GetEmployeeDetailModel {
  int? code;
  Data? data;
  String? message;
  int? statusCode;

  GetEmployeeDetailModel({
    this.code,
    this.data,
    this.message,
    this.statusCode,
  });

  factory GetEmployeeDetailModel.fromJson(Map<String, dynamic> json) =>
      GetEmployeeDetailModel(
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
  int? umdId;
  int? umId;
  String? experienceYears;
  String? experienceMonth;
  String? currentCompany;
  String? jobTitle;
  String? currentSalary;
  DateTime? workDurationFromDate;
  DateTime? workDurationToDate;
  String? noticePeriod;
  String? keySkills;
  String? educationDetails;
  String? universityName;
  String? preferredSalary;
  String? prefferedLocation;
  String? resume;
  String? photo;

  Data({
    this.umdId,
    this.umId,
    this.experienceYears,
    this.experienceMonth,
    this.currentCompany,
    this.jobTitle,
    this.currentSalary,
    this.workDurationFromDate,
    this.workDurationToDate,
    this.noticePeriod,
    this.keySkills,
    this.educationDetails,
    this.universityName,
    this.preferredSalary,
    this.prefferedLocation,
    this.resume,
    this.photo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        umdId: json["umdId"],
        umId: json["umId"],
        experienceYears: json["experience_years"],
        experienceMonth: json["experience_month"],
        currentCompany: json["currentCompany"],
        jobTitle: json["jobTitle"],
        currentSalary: json["currentSalary"],
        workDurationFromDate: json["workDurationFromDate"] == null
            ? null
            : DateTime.parse(json["workDurationFromDate"]),
        workDurationToDate: json["workDurationToDate"] == null
            ? null
            : DateTime.parse(json["workDurationToDate"]),
        noticePeriod: json["noticePeriod"],
        keySkills: json["keySkills"],
        educationDetails: json["educationDetails"],
        universityName: json["universityName"],
        preferredSalary: json["preferredSalary"],
        prefferedLocation: json["prefferedLocation"],
        resume: json["resume"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "umdId": umdId,
        "umId": umId,
        "experience_years": experienceYears,
        "experience_month": experienceMonth,
        "currentCompany": currentCompany,
        "jobTitle": jobTitle,
        "currentSalary": currentSalary,
        "workDurationFromDate": workDurationFromDate?.toIso8601String(),
        "workDurationToDate": workDurationToDate?.toIso8601String(),
        "noticePeriod": noticePeriod,
        "keySkills": keySkills,
        "educationDetails": educationDetails,
        "universityName": universityName,
        "preferredSalary": preferredSalary,
        "prefferedLocation": prefferedLocation,
        "resume": resume,
        "photo": photo,
      };
}
