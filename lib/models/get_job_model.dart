// To parse this JSON data, do
//
//     final getJobModel = getJobModelFromJson(jsonString);

import 'dart:convert';

GetJobModel getJobModelFromJson(String str) => GetJobModel.fromJson(json.decode(str));

String getJobModelToJson(GetJobModel data) => json.encode(data.toJson());

class GetJobModel {
    int? code;
    List<JobDetails>? data;
    String? message;
    int? statusCode;

    GetJobModel({
        this.code,
        this.data,
        this.message,
        this.statusCode,
    });

    factory GetJobModel.fromJson(Map<String, dynamic> json) => GetJobModel(
        code: json["code"],
        data: json["data"] == null ? [] : List<JobDetails>.from(json["data"]!.map((x) => JobDetails.fromJson(x))),
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

class JobDetails {
    int? jpId;
    String? jpImage;
    String? designation;
    String? company;
    String? location;
    String? skills;
    String? salary;
    String? noOfOpenings;
    String? jpDescription;

    JobDetails({
        this.jpId,
        this.jpImage,
        this.designation,
        this.company,
        this.location,
        this.skills,
        this.salary,
        this.noOfOpenings,
        this.jpDescription,
    });

    factory JobDetails.fromJson(Map<String, dynamic> json) => JobDetails(
        jpId: json["jpId"],
        jpImage: json["jpImage"],
        designation: json["designation"],
        company: json["company"],
        location: json["location"],
        skills: json["skills"],
        salary: json["salary"],
        noOfOpenings: json["noOfOpenings"],
        jpDescription: json["jpDescription"],
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
    };
}
