// To parse this JSON data, do
//
//     final visitorList = visitorListFromJson(jsonString);

import 'dart:convert';

List<VisitorList> visitorListFromJson(String str) => List<VisitorList>.from(json.decode(str).map((x) => VisitorList.fromJson(x)));

String visitorListToJson(List<VisitorList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VisitorList {
  String id;
  Userid userid;
  String name;
  String purpose;
  String address;
  String phno;
  DateTime visitingtime;

  VisitorList({
    required this.id,
    required this.userid,
    required this.name,
    required this.purpose,
    required this.address,
    required this.phno,
    required this.visitingtime,
  });

  factory VisitorList.fromJson(Map<String, dynamic> json) => VisitorList(
    id: json["_id"],
    userid: Userid.fromJson(json["userid"]),
    name: json["name"],
    purpose: json["purpose"],
    address: json["address"],
    phno: json["phno"],
    visitingtime: DateTime.parse(json["visitingtime"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userid": userid.toJson(),
    "name": name,
    "purpose": purpose,
    "address": address,
    "phno": phno,
    "visitingtime": visitingtime.toIso8601String(),
  };
}

class Userid {
  String name;
  String email;

  Userid({
    required this.name,
    required this.email,
  });

  factory Userid.fromJson(Map<String, dynamic> json) => Userid(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
  };
}
