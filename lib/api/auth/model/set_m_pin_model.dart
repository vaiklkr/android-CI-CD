// ignore_for_file: prefer_void_to_null, prefer_collection_literals

class SetMPinModel {
  bool? success;
  String? message;
  String? data;
  String? timestamp;

  SetMPinModel({this.success, this.message, this.data, this.timestamp});

  SetMPinModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data;
    data['timestamp'] = timestamp;
    return data;
  }
}
