// To parse this JSON data, do
//
//     final visitor = visitorFromJson(jsonString);

import 'dart:convert';

List<Visitor> visitorFromJson(String str) => List<Visitor>.from(json.decode(str).map((x) => Visitor.fromJson(x)));

String visitorToJson(List<Visitor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Visitor {
  String userid;
  String name;
  String purpose;
  String address;
  String phno;

  Visitor({
    required this.userid,
    required this.name,
    required this.purpose,
    required this.address,
    required this.phno,
  });

  factory Visitor.fromJson(Map<String, dynamic> json) => Visitor(
    userid: json["userid"],
    name: json["name"],
    purpose: json["purpose"],
    address: json["address"],
    phno: json["phno"],
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "name": name,
    "purpose": purpose,
    "address": address,
    "phno": phno,
  };
}
