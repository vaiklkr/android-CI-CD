class TrainingLiveListModel {
  TrainingLiveListModel({
      bool? success, 
      String? message, 
      List<Data>? data, 
      String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
}

  TrainingLiveListModel.fromJson(dynamic json) {
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
TrainingLiveListModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
  String? timestamp,
}) => TrainingLiveListModel(  success: success ?? _success,
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
      num? srno, 
      num? courseid, 
      String? coursename, 
      String? description, 
      String? thumbnail, 
      String? sharecontent, 
      String? meetingurl, 
      String? meetingpassword, 
      String? trainingstartdatetime, 
      String? trainingenddatetime, 
      String? duration, 
      num? fincoinrewards, 
      String? status, 
      num? priority, 
      num? noofusers,}){
    _srno = srno;
    _courseid = courseid;
    _coursename = coursename;
    _description = description;
    _thumbnail = thumbnail;
    _sharecontent = sharecontent;
    _meetingurl = meetingurl;
    _meetingpassword = meetingpassword;
    _trainingstartdatetime = trainingstartdatetime;
    _trainingenddatetime = trainingenddatetime;
    _duration = duration;
    _fincoinrewards = fincoinrewards;
    _status = status;
    _priority = priority;
    _noofusers = noofusers;
}

  Data.fromJson(dynamic json) {
    _srno = json['srno'];
    _courseid = json['courseid'];
    _coursename = json['coursename'];
    _description = json['description'];
    _thumbnail = json['thumbnail'];
    _sharecontent = json['sharecontent'];
    _meetingurl = json['meetingurl'];
    _meetingpassword = json['meetingpassword'];
    _trainingstartdatetime = json['trainingstartdatetime'];
    _trainingenddatetime = json['trainingenddatetime'];
    _duration = json['duration'];
    _fincoinrewards = json['fincoinrewards'];
    _status = json['status'];
    _priority = json['priority'];
    _noofusers = json['noofusers'];
  }
  num? _srno;
  num? _courseid;
  String? _coursename;
  String? _description;
  String? _thumbnail;
  String? _sharecontent;
  String? _meetingurl;
  String? _meetingpassword;
  String? _trainingstartdatetime;
  String? _trainingenddatetime;
  String? _duration;
  num? _fincoinrewards;
  String? _status;
  num? _priority;
  num? _noofusers;
Data copyWith({  num? srno,
  num? courseid,
  String? coursename,
  String? description,
  String? thumbnail,
  String? sharecontent,
  String? meetingurl,
  String? meetingpassword,
  String? trainingstartdatetime,
  String? trainingenddatetime,
  String? duration,
  num? fincoinrewards,
  String? status,
  num? priority,
  num? noofusers,
}) => Data(  srno: srno ?? _srno,
  courseid: courseid ?? _courseid,
  coursename: coursename ?? _coursename,
  description: description ?? _description,
  thumbnail: thumbnail ?? _thumbnail,
  sharecontent: sharecontent ?? _sharecontent,
  meetingurl: meetingurl ?? _meetingurl,
  meetingpassword: meetingpassword ?? _meetingpassword,
  trainingstartdatetime: trainingstartdatetime ?? _trainingstartdatetime,
  trainingenddatetime: trainingenddatetime ?? _trainingenddatetime,
  duration: duration ?? _duration,
  fincoinrewards: fincoinrewards ?? _fincoinrewards,
  status: status ?? _status,
  priority: priority ?? _priority,
  noofusers: noofusers ?? _noofusers,
);
  num? get srno => _srno;
  num? get courseid => _courseid;
  String? get coursename => _coursename;
  String? get description => _description;
  String? get thumbnail => _thumbnail;
  String? get sharecontent => _sharecontent;
  String? get meetingurl => _meetingurl;
  String? get meetingpassword => _meetingpassword;
  String? get trainingstartdatetime => _trainingstartdatetime;
  String? get trainingenddatetime => _trainingenddatetime;
  String? get duration => _duration;
  num? get fincoinrewards => _fincoinrewards;
  String? get status => _status;
  num? get priority => _priority;
  num? get noofusers => _noofusers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['srno'] = _srno;
    map['courseid'] = _courseid;
    map['coursename'] = _coursename;
    map['description'] = _description;
    map['thumbnail'] = _thumbnail;
    map['sharecontent'] = _sharecontent;
    map['meetingurl'] = _meetingurl;
    map['meetingpassword'] = _meetingpassword;
    map['trainingstartdatetime'] = _trainingstartdatetime;
    map['trainingenddatetime'] = _trainingenddatetime;
    map['duration'] = _duration;
    map['fincoinrewards'] = _fincoinrewards;
    map['status'] = _status;
    map['priority'] = _priority;
    map['noofusers'] = _noofusers;
    return map;
  }

}