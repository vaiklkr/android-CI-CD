class VerifyAadhaarModel {
  bool? success;
  String? message;
  VerifyAadhaarData? data;
  String? timestamp;

  VerifyAadhaarModel({this.success, this.message, this.data, this.timestamp});

  VerifyAadhaarModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data =
        json['data'] != null ? VerifyAadhaarData.fromJson(json['data']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class VerifyAadhaarData {
  String? status;
  String? sessionid;
  String? message;
  String? referenceId;
  String? captchaImage;

  VerifyAadhaarData(
      {this.status,
      this.sessionid,
      this.message,
      this.referenceId,
      this.captchaImage});

  VerifyAadhaarData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sessionid = json['sessionid'];
    message = json['message'];
    referenceId = json['reference_id'];
    captchaImage = json['captchaImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['sessionid'] = sessionid;
    data['message'] = message;
    data['reference_id'] = referenceId;
    data['captchaImage'] = captchaImage;
    return data;
  }
}
