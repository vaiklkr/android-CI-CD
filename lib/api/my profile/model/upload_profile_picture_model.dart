class UploadProfilePictureModel {
  bool? success;
  String? message;
  Data? data;
  String? timestamp;

  UploadProfilePictureModel(
      {this.success, this.message, this.data, this.timestamp});

  UploadProfilePictureModel.fromJson(Map<String, dynamic> json) {
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
  String? iconUrl;

  Data({this.iconUrl});

  Data.fromJson(Map<String, dynamic> json) {
    iconUrl = json['iconUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iconUrl'] = iconUrl;
    return data;
  }
}
