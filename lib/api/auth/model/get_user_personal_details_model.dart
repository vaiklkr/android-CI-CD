class GetUserPersonalDetailsModel {
  GetUserPersonalDetailsModel({
      bool? success, 
      String? message, 
      List<Data>? data, 
      String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
}

  GetUserPersonalDetailsModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _timestamp = json['timestamp'];
  }
  bool? _success;
  String? _message;
  List<Data>? _data;
  String? _timestamp;
GetUserPersonalDetailsModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
  String? timestamp,
}) => GetUserPersonalDetailsModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  timestamp: timestamp ?? _timestamp,
);
  bool? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;
  String? get timestamp => _timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['timestamp'] = _timestamp;
    return map;
  }

}

class Data {
  Data({
      String? occupation, 
      String? qualification, 
      String? income, 
      String? dob, 
      num? pincode, 
      String? city, 
      String? district, 
      String? state,}){
    _occupation = occupation;
    _qualification = qualification;
    _income = income;
    _dob = dob;
    _pincode = pincode;
    _city = city;
    _district = district;
    _state = state;
}

  Data.fromJson(dynamic json) {
    _occupation = json['occupation'];
    _qualification = json['qualification'];
    _income = json['income'];
    _dob = json['dob'];
    _pincode = json['pincode'];
    _city = json['city'];
    _district = json['district'];
    _state = json['state'];
  }
  String? _occupation;
  String? _qualification;
  String? _income;
  String? _dob;
  num? _pincode;
  String? _city;
  String? _district;
  String? _state;
Data copyWith({  String? occupation,
  String? qualification,
  String? income,
  String? dob,
  num? pincode,
  String? city,
  String? district,
  String? state,
}) => Data(  occupation: occupation ?? _occupation,
  qualification: qualification ?? _qualification,
  income: income ?? _income,
  dob: dob ?? _dob,
  pincode: pincode ?? _pincode,
  city: city ?? _city,
  district: district ?? _district,
  state: state ?? _state,
);
  String? get occupation => _occupation;
  String? get qualification => _qualification;
  String? get income => _income;
  String? get dob => _dob;
  num? get pincode => _pincode;
  String? get city => _city;
  String? get district => _district;
  String? get state => _state;

  set occupation(String? value) {
    occupation = value;
  }

  set qualification(String? value) {
    qualification = value;
  }

  set income(String? value) {
    income = value;
  }

  set dob(String? value) {
    dob = value;
  }

  set pincode(num? value) {
    pincode = value;
  }

  set city(String? value) {
    city = value;
  }

  set district(String? value) {
    district = value;
  }

  set state(String? value) {
    state = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['occupation'] = _occupation;
    map['qualification'] = _qualification;
    map['income'] = _income;
    map['dob'] = _dob;
    map['pincode'] = _pincode;
    map['city'] = _city;
    map['district'] = _district;
    map['state'] = _state;
    return map;
  }

}