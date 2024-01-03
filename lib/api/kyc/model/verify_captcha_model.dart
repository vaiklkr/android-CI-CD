class VerifyCaptchaModel {
  bool? success;
  String? message;
  VerifyCaptchaData? data;
  String? timestamp;

  VerifyCaptchaModel({this.success, this.message, this.data, this.timestamp});

  VerifyCaptchaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data =
        json['data'] != null ? VerifyCaptchaData.fromJson(json['data']) : null;
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

class VerifyCaptchaData {
  String? status;
  String? sessionid;
  String? message;
  String? referenceId;

  VerifyCaptchaData(
      {this.status, this.sessionid, this.message, this.referenceId});

  VerifyCaptchaData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sessionid = json['sessionid'];
    message = json['message'];
    referenceId = json['reference_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['sessionid'] = sessionid;
    data['message'] = message;
    data['reference_id'] = referenceId;
    return data;
  }
}
