// To parse this JSON data, do
//
//     final validMpinModel = validMpinModelFromJson(jsonString);

import 'dart:convert';

ValidMpinModel validMpinModelFromJson(String str) => ValidMpinModel.fromJson(json.decode(str));

String validMpinModelToJson(ValidMpinModel data) => json.encode(data.toJson());

class ValidMpinModel {
  bool success;
  String message;
  dynamic data;
  DateTime timestamp;

  ValidMpinModel({
    required this.success,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory ValidMpinModel.fromJson(Map<String, dynamic> json) => ValidMpinModel(
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
