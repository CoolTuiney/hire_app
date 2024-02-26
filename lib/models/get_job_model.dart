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
     int? jpId;
    String? jpImage;
    String? designation;
    String? company;
    String? location;
    String? skills;
    String? salary;
    String? noOfOpenings;
    String? jpDescription;

    JobList({
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

    factory JobList.fromJson(Map<String, dynamic> json) => JobList(
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
