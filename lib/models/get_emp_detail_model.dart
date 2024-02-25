// To parse this JSON data, do
//
//     final getEmployeeDetailModel = getEmployeeDetailModelFromJson(jsonString);

import 'dart:convert';

GetEmployeeDetailModel getEmployeeDetailModelFromJson(String str) => GetEmployeeDetailModel.fromJson(json.decode(str));

String getEmployeeDetailModelToJson(GetEmployeeDetailModel data) => json.encode(data.toJson());

class GetEmployeeDetailModel {
    int? code;
    Data? data;
    String? message;

    GetEmployeeDetailModel({
        this.code,
        this.data,
        this.message,
    });

    factory GetEmployeeDetailModel.fromJson(Map<String, dynamic> json) => GetEmployeeDetailModel(
        code: json["Code"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
        message: json["Message"],
    );

    Map<String, dynamic> toJson() => {
        "Code": code,
        "Data": data?.toJson(),
        "Message": message,
    };
}

class Data {
    String? experienceYears;
    String? experienceMonth;
    String? currentCompany;
    String? jobTitle;
    String? currentSalary;
    String? workDurationFromDate;
    String? workDurationToDate;
    String? noticePeriod;
    String? keySkills;
    String? educationDetails;
    String? univercityName;
    String? preferredSalary;
    String? prefferedLocation;
    String? resume;
    String? photo;

    Data({
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
        this.univercityName,
        this.preferredSalary,
        this.prefferedLocation,
        this.resume,
        this.photo,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        experienceYears: json["experience_years"],
        experienceMonth: json["experience_month"],
        currentCompany: json["currentCompany"],
        jobTitle: json["jobTitle"],
        currentSalary: json["currentSalary"],
        workDurationFromDate: json["workDurationFromDate"],
        workDurationToDate: json["workDurationToDate"],
        noticePeriod: json["noticePeriod"],
        keySkills: json["keySkills"],
        educationDetails: json["educationDetails"],
        univercityName: json["univercityName"],
        preferredSalary: json["preferredSalary"],
        prefferedLocation: json["prefferedLocation"],
        resume: json["resume"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "experience_years": experienceYears,
        "experience_month": experienceMonth,
        "currentCompany": currentCompany,
        "jobTitle": jobTitle,
        "currentSalary": currentSalary,
        "workDurationFromDate": workDurationFromDate,
        "workDurationToDate": workDurationToDate,
        "noticePeriod": noticePeriod,
        "keySkills": keySkills,
        "educationDetails": educationDetails,
        "univercityName": univercityName,
        "preferredSalary": preferredSalary,
        "prefferedLocation": prefferedLocation,
        "resume": resume,
        "photo": photo,
    };
}
