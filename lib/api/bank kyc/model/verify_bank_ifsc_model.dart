class VerifyBankNameByIFSCModel {
  bool? success;
  String? message;
  String? data;
  String? timestamp;

  VerifyBankNameByIFSCModel(
      {this.success, this.message, this.data, this.timestamp});

  VerifyBankNameByIFSCModel.fromJson(Map<String, dynamic> json) {
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
