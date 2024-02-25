// To parse this JSON data, do
//
//     final getJobModel = getJobModelFromJson(jsonString);

import 'dart:convert';

GetJobModel getJobModelFromJson(String str) => GetJobModel.fromJson(json.decode(str));

String getJobModelToJson(GetJobModel data) => json.encode(data.toJson());

class GetJobModel {
    int? code;
    Data? data;
    String? message;

    GetJobModel({
        this.code,
        this.data,
        this.message,
    });

    factory GetJobModel.fromJson(Map<String, dynamic> json) => GetJobModel(
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
    List<JobList>? jobList;

    Data({
        this.jobList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        jobList: json["jobList"] == null ? [] : List<JobList>.from(json["jobList"]!.map((x) => JobList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "jobList": jobList == null ? [] : List<dynamic>.from(jobList!.map((x) => x.toJson())),
    };
}

class JobList {
    String? imageUrl;
    String? designation;
    String? companyName;
    String? locationName;
    String? skills;
    String? salary;
    String? numberOfOpenings;
    String? jobDescription;

    JobList({
        this.imageUrl,
        this.designation,
        this.companyName,
        this.locationName,
        this.skills,
        this.salary,
        this.numberOfOpenings,
        this.jobDescription,
    });

    factory JobList.fromJson(Map<String, dynamic> json) => JobList(
        imageUrl: json["imageUrl"],
        designation: json["designation"],
        companyName: json["companyName"],
        locationName: json["locationName"],
        skills: json["skills"],
        salary: json["salary"],
        numberOfOpenings: json["numberOfOpenings"],
        jobDescription: json["jobDescription"],
    );

    Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "designation": designation,
        "companyName": companyName,
        "locationName": locationName,
        "skills": skills,
        "salary": salary,
        "numberOfOpenings": numberOfOpenings,
        "jobDescription": jobDescription,
    };
}
