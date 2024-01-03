class CustomerDetailModel {
  CustomerDetailModel({
      bool? success, 
      String? message, 
      Data? data, 
      String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
}

  CustomerDetailModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _timestamp = json['timestamp'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  String? _timestamp;
CustomerDetailModel copyWith({  bool? success,
  String? message,
  Data? data,
  String? timestamp,
}) => CustomerDetailModel(  success: success ?? _success,
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
      String? mobilenumber, 
      String? emailid, 
      List<LeadStatuse>? leadStatuse,}){
    _mobilenumber = mobilenumber;
    _emailid = emailid;
    _leadStatuse = leadStatuse;
}

  Data.fromJson(dynamic json) {
    _mobilenumber = json['mobilenumber'];
    _emailid = json['emailid'];
    if (json['leadStatuse'] != null) {
      _leadStatuse = [];
      json['leadStatuse'].forEach((v) {
        _leadStatuse?.add(LeadStatuse.fromJson(v));
      });
    }
  }
  String? _mobilenumber;
  String? _emailid;
  List<LeadStatuse>? _leadStatuse;
Data copyWith({  String? mobilenumber,
  String? emailid,
  List<LeadStatuse>? leadStatuse,
}) => Data(  mobilenumber: mobilenumber ?? _mobilenumber,
  emailid: emailid ?? _emailid,
  leadStatuse: leadStatuse ?? _leadStatuse,
);
  String? get mobilenumber => _mobilenumber;
  String? get emailid => _emailid;
  List<LeadStatuse>? get leadStatuse => _leadStatuse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobilenumber'] = _mobilenumber;
    map['emailid'] = _emailid;
    if (_leadStatuse != null) {
      map['leadStatuse'] = _leadStatuse?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class LeadStatuse {
  LeadStatuse({
      num? srno, 
      String? status, 
      String? details, 
      String? updateddate,}){
    _srno = srno;
    _status = status;
    _details = details;
    _updateddate = updateddate;
}

  LeadStatuse.fromJson(dynamic json) {
    _srno = json['srno'];
    _status = json['status'];
    _details = json['details'];
    _updateddate = json['updateddate'];
  }
  num? _srno;
  String? _status;
  String? _details;
  String? _updateddate;
LeadStatuse copyWith({  num? srno,
  String? status,
  String? details,
  String? updateddate,
}) => LeadStatuse(  srno: srno ?? _srno,
  status: status ?? _status,
  details: details ?? _details,
  updateddate: updateddate ?? _updateddate,
);
  num? get srno => _srno;
  String? get status => _status;
  String? get details => _details;
  String? get updateddate => _updateddate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['srno'] = _srno;
    map['status'] = _status;
    map['details'] = _details;
    map['updateddate'] = _updateddate;
    return map;
  }

}