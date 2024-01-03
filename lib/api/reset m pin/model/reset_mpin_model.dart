// To parse this JSON data, do
//
//     final myProfileResetMpinmodel = myProfileResetMpinmodelFromJson(jsonString);

import 'dart:convert';

MyProfileResetMpinmodel myProfileResetMpinmodelFromJson(String str) => MyProfileResetMpinmodel.fromJson(json.decode(str));

String myProfileResetMpinmodelToJson(MyProfileResetMpinmodel data) => json.encode(data.toJson());

class MyProfileResetMpinmodel {
  bool success;
  String message;
  dynamic data;
  DateTime timestamp;

  MyProfileResetMpinmodel({
    required this.success,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory MyProfileResetMpinmodel.fromJson(Map<String, dynamic> json) => MyProfileResetMpinmodel(
    success: json["success"],
    message: json["message"],
    data: json["data"],
    timestamp: DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
    "timestamp": timestamp.toIso8601String(),
  };
}
