// To parse this JSON data, do
//
//     final appliedJobModel = appliedJobModelFromJson(jsonString);

import 'dart:convert';

AppliedJobModel appliedJobModelFromJson(String str) => AppliedJobModel.fromJson(json.decode(str));

String appliedJobModelToJson(AppliedJobModel data) => json.encode(data.toJson());

class AppliedJobModel {
    int? code;
    List<AppliedJobData>? data;
    String? message;
    int? statusCode;

    AppliedJobModel({
        this.code,
        this.data,
        this.message,
        this.statusCode,
    });

    factory AppliedJobModel.fromJson(Map<String, dynamic> json) => AppliedJobModel(
        code: json["code"],
        data: json["data"] == null ? [] : List<AppliedJobData>.from(json["data"]!.map((x) => AppliedJobData.fromJson(x))),
        message: json["message"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "statusCode": statusCode,
    };
}

class AppliedJobData {
    int? jpId;
    String? jpImage;
    String? designation;
    String? company;
    String? location;
    String? skills;
    String? salary;
    String? noOfOpenings;
    String? jpDescription;
    List<JobAppliedUser>? jobAppliedUsers;

    AppliedJobData({
        this.jpId,
        this.jpImage,
        this.designation,
        this.company,
        this.location,
        this.skills,
        this.salary,
        this.noOfOpenings,
        this.jpDescription,
        this.jobAppliedUsers,
    });

    factory AppliedJobData.fromJson(Map<String, dynamic> json) => AppliedJobData(
        jpId: json["jpId"],
        jpImage: json["jpImage"],
        designation: json["designation"],
        company: json["company"],
        location: json["location"],
        skills: json["skills"],
        salary: json["salary"],
        noOfOpenings: json["noOfOpenings"],
        jpDescription: json["jpDescription"],
        jobAppliedUsers: json["jobAppliedUsers"] == null ? [] : List<JobAppliedUser>.from(json["jobAppliedUsers"]!.map((x) => JobAppliedUser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "jpId": jpId,
        "jpImage": jpImage,
        "designation": designation,
        "company": company,
        "location": location,
        "skills": skills,
        "salary": salary,
        "noOfOpenings": noOfOpenings,
        "jpDescription": jpDescription,
        "jobAppliedUsers": jobAppliedUsers == null ? [] : List<dynamic>.from(jobAppliedUsers!.map((x) => x.toJson())),
    };
}

class JobAppliedUser {
    int? jpId;
    int? umId;
    String? fullName;
    String? emailId;
    String? mobileNo;

    JobAppliedUser({
        this.jpId,
        this.umId,
        this.fullName,
        this.emailId,
        this.mobileNo,
    });

    factory JobAppliedUser.fromJson(Map<String, dynamic> json) => JobAppliedUser(
        jpId: json["jpId"],
        umId: json["umId"],
        fullName: json["fullName"],
        emailId: json["emailId"],
        mobileNo: json["mobileNo"],
    );

    Map<String, dynamic> toJson() => {
        "jpId": jpId,
        "umId": umId,
        "fullName": fullName,
        "emailId": emailId,
        "mobileNo": mobileNo,
    };
}
