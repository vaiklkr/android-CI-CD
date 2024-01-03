class SignUpModel {
  SignUpModel({
      bool? success, 
      String? message, 
      Data? data, 
      String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
}

  SignUpModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _timestamp = json['timestamp'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  String? _timestamp;
SignUpModel copyWith({  bool? success,
  String? message,
  Data? data,
  String? timestamp,
}) => SignUpModel(  success: success ?? _success,
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
      String? mobileNumber, 
      String? profileUrl, 
      String? token, 
      String? finID, 
      String? name, 
      String? emailID, 
      bool? isPersonalDetailsAdded, 
      bool? isPanKYCCompleted, 
      bool? isAadhaarKYCCompleted,}){
    _mobileNumber = mobileNumber;
    _profileUrl = profileUrl;
    _token = token;
    _finID = finID;
    _name = name;
    _emailID = emailID;
    _isPersonalDetailsAdded = isPersonalDetailsAdded;
    _isPanKYCCompleted = isPanKYCCompleted;
    _isAadhaarKYCCompleted = isAadhaarKYCCompleted;
}

  Data.fromJson(dynamic json) {
    _mobileNumber = json['mobileNumber'];
    _profileUrl = json['profile_url'];
    _token = json['token'];
    _finID = json['finID'];
    _name = json['name'];
    _emailID = json['emailID'];
    _isPersonalDetailsAdded = json['isPersonalDetailsAdded'];
    _isPanKYCCompleted = json['isPanKYCCompleted'];
    _isAadhaarKYCCompleted = json['isAadhaarKYCCompleted'];
  }
  String? _mobileNumber;
  String? _profileUrl;
  String? _token;
  String? _finID;
  String? _name;
  String? _emailID;
  bool? _isPersonalDetailsAdded;
  bool? _isPanKYCCompleted;
  bool? _isAadhaarKYCCompleted;
Data copyWith({  String? mobileNumber,
  String? profileUrl,
  String? token,
  String? finID,
  String? name,
  String? emailID,
  bool? isPersonalDetailsAdded,
  bool? isPanKYCCompleted,
  bool? isAadhaarKYCCompleted,
}) => Data(  mobileNumber: mobileNumber ?? _mobileNumber,
  profileUrl: profileUrl ?? _profileUrl,
  token: token ?? _token,
  finID: finID ?? _finID,
  name: name ?? _name,
  emailID: emailID ?? _emailID,
  isPersonalDetailsAdded: isPersonalDetailsAdded ?? _isPersonalDetailsAdded,
  isPanKYCCompleted: isPanKYCCompleted ?? _isPanKYCCompleted,
  isAadhaarKYCCompleted: isAadhaarKYCCompleted ?? _isAadhaarKYCCompleted,
);
  String? get mobileNumber => _mobileNumber;
  String? get profileUrl => _profileUrl;
  String? get token => _token;
  String? get finID => _finID;
  String? get name => _name;
  String? get emailID => _emailID;
  bool? get isPersonalDetailsAdded => _isPersonalDetailsAdded;
  bool? get isPanKYCCompleted => _isPanKYCCompleted;
  bool? get isAadhaarKYCCompleted => _isAadhaarKYCCompleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobileNumber'] = _mobileNumber;
    map['profile_url'] = _profileUrl;
    map['token'] = _token;
    map['finID'] = _finID;
    map['name'] = _name;
    map['emailID'] = _emailID;
    map['isPersonalDetailsAdded'] = _isPersonalDetailsAdded;
    map['isPanKYCCompleted'] = _isPanKYCCompleted;
    map['isAadhaarKYCCompleted'] = _isAadhaarKYCCompleted;
    return map;
  }

}