class AddCustomerModel {
  bool? success;
  String? message;
  String? timestamp;

  AddCustomerModel({this.success, this.message, this.timestamp});

  AddCustomerModel.fromJson(Map<String, dynamic> json) {
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
