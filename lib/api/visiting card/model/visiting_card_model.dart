// ignore_for_file: prefer_void_to_null

class VisitingCardModel {
  bool? success;
  String? message;
  Data? data;
  String? timestamp;

  VisitingCardModel({this.success, this.message, this.data, this.timestamp});

  VisitingCardModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? occupation;
  String? mailId;
  String? mobileNumber;
  String? address;
  String? profileURL;
  Null myStoreURL;

  Data(
      {this.name,
      this.occupation,
      this.mailId,
      this.mobileNumber,
      this.address,
      this.profileURL,
      this.myStoreURL});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    occupation = json['occupation'];
    mailId = json['mailId'];
    mobileNumber = json['mobileNumber'];
    address = json['address'];
    profileURL = json['profileURL'];
    myStoreURL = json['myStoreURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['occupation'] = occupation;
    data['mailId'] = mailId;
    data['mobileNumber'] = mobileNumber;
    data['address'] = address;
    data['profileURL'] = profileURL;
    data['myStoreURL'] = myStoreURL;
    return data;
  }
}
