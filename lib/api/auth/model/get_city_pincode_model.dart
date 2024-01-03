class GetCityPincodeModel {
  GetCityPincodeModel({
      bool? success, 
      String? message, 
      Data? data, 
      String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
}

  GetCityPincodeModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _timestamp = json['timestamp'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  String? _timestamp;
GetCityPincodeModel copyWith({  bool? success,
  String? message,
  Data? data,
  String? timestamp,
}) => GetCityPincodeModel(  success: success ?? _success,
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
      List<String>? name, 
      String? state, 
      String? district,}){
    _name = name;
    _state = state;
    _district = district;
}

  Data.fromJson(dynamic json) {
    _name = json['name'] != null ? json['name'].cast<String>() : [];
    _state = json['state'];
    _district = json['district'];
  }
  List<String>? _name;
  String? _state;
  String? _district;
Data copyWith({  List<String>? name,
  String? state,
  String? district,
}) => Data(  name: name ?? _name,
  state: state ?? _state,
  district: district ?? _district,
);
  List<String>? get name => _name;
  String? get state => _state;
  String? get district => _district;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['state'] = _state;
    map['district'] = _district;
    return map;
  }

}