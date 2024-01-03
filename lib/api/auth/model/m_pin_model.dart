class MPinModel {
  MPinModel({
      bool? success, 
      String? message, 
      Data? data, 
      String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
}

  MPinModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _timestamp = json['timestamp'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  String? _timestamp;
MPinModel copyWith({  bool? success,
  String? message,
  Data? data,
  String? timestamp,
}) => MPinModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  timestamp: timestamp ?? _timestamp,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;
  String? get timestamp => _timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['timestamp'] = _timestamp;
    return map;
  }

}

class Data {
  Data({
      bool? isPersonalDetailsAdded, 
      bool? isPanKYCCompleted, 
      bool? isAadhaarKYCCompleted,}){
    _isPersonalDetailsAdded = isPersonalDetailsAdded;
    _isPanKYCCompleted = isPanKYCCompleted;
    _isAadhaarKYCCompleted = isAadhaarKYCCompleted;
}

  Data.fromJson(dynamic json) {
    _isPersonalDetailsAdded = json['isPersonalDetailsAdded'];
    _isPanKYCCompleted = json['isPanKYCCompleted'];
    _isAadhaarKYCCompleted = json['isAadhaarKYCCompleted'];
  }
  bool? _isPersonalDetailsAdded;
  bool? _isPanKYCCompleted;
  bool? _isAadhaarKYCCompleted;
Data copyWith({  bool? isPersonalDetailsAdded,
  bool? isPanKYCCompleted,
  bool? isAadhaarKYCCompleted,
}) => Data(  isPersonalDetailsAdded: isPersonalDetailsAdded ?? _isPersonalDetailsAdded,
  isPanKYCCompleted: isPanKYCCompleted ?? _isPanKYCCompleted,
  isAadhaarKYCCompleted: isAadhaarKYCCompleted ?? _isAadhaarKYCCompleted,
);
  bool? get isPersonalDetailsAdded => _isPersonalDetailsAdded;
  bool? get isPanKYCCompleted => _isPanKYCCompleted;
  bool? get isAadhaarKYCCompleted => _isAadhaarKYCCompleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isPersonalDetailsAdded'] = _isPersonalDetailsAdded;
    map['isPanKYCCompleted'] = _isPanKYCCompleted;
    map['isAadhaarKYCCompleted'] = _isAadhaarKYCCompleted;
    return map;
  }

}