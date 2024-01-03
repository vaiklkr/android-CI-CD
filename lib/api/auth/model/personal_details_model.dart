// ignore_for_file: prefer_void_to_null

class PersonalDetailsModel {
  bool? success;
  String? message;
  Null data;
  String? timestamp;

  PersonalDetailsModel({this.success, this.message, this.data, this.timestamp});

  PersonalDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data;
    data['timestamp'] = timestamp;
    return data;
  }
}
