// ignore_for_file: prefer_void_to_null

class OTPToResetMPINModel {
  bool? success;
  String? message;
  String? timestamp;

  OTPToResetMPINModel({this.success, this.message, this.timestamp});

  OTPToResetMPINModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['timestamp'] = timestamp;
    return data;
  }
}
