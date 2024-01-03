class VerifyPanModel {
  bool? success;
  String? message;
  Data? data;
  String? timestamp;

  VerifyPanModel({this.success, this.message, this.data, this.timestamp});

  VerifyPanModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? panNumber;
  String? name;
  String? referenceId;

  Data({this.panNumber, this.name, this.referenceId});

  Data.fromJson(Map<String, dynamic> json) {
    panNumber = json['panNumber'];
    name = json['name'];
    referenceId = json['reference_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['panNumber'] = panNumber;
    data['name'] = name;
    data['reference_id'] = referenceId;
    return data;
  }
}
