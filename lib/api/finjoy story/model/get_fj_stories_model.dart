class GetFJStoriesModel {
  GetFJStoriesModel({
      bool? success, 
      String? message, 
      List<Data>? data, 
      String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
}

  GetFJStoriesModel.fromJson(dynamic json) {
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
GetFJStoriesModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
  String? timestamp,
}) => GetFJStoriesModel(  success: success ?? _success,
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
      String? storyUrl, 
      String? status, 
      num? priority, 
      bool? isOffer, 
      bool? isExternalurl, 
      String? buttontext, 
      dynamic createdDate, 
      dynamic cta, 
      String? shareurl, 
      String? sharecontent,}){
    _storyUrl = storyUrl;
    _status = status;
    _priority = priority;
    _isOffer = isOffer;
    _isExternalurl = isExternalurl;
    _buttontext = buttontext;
    _createdDate = createdDate;
    _cta = cta;
    _shareurl = shareurl;
    _sharecontent = sharecontent;
}

  Data.fromJson(dynamic json) {
    _storyUrl = json['story_url'];
    _status = json['status'];
    _priority = json['priority'];
    _isOffer = json['is_offer'];
    _isExternalurl = json['is_externalurl'];
    _buttontext = json['buttontext'];
    _createdDate = json['created_date'];
    _cta = json['cta'];
    _shareurl = json['shareurl'];
    _sharecontent = json['sharecontent'];
  }
  String? _storyUrl;
  String? _status;
  num? _priority;
  bool? _isOffer;
  bool? _isExternalurl;
  String? _buttontext;
  dynamic _createdDate;
  dynamic _cta;
  String? _shareurl;
  String? _sharecontent;
Data copyWith({  String? storyUrl,
  String? status,
  num? priority,
  bool? isOffer,
  bool? isExternalurl,
  String? buttontext,
  dynamic createdDate,
  dynamic cta,
  String? shareurl,
  String? sharecontent,
}) => Data(  storyUrl: storyUrl ?? _storyUrl,
  status: status ?? _status,
  priority: priority ?? _priority,
  isOffer: isOffer ?? _isOffer,
  isExternalurl: isExternalurl ?? _isExternalurl,
  buttontext: buttontext ?? _buttontext,
  createdDate: createdDate ?? _createdDate,
  cta: cta ?? _cta,
  shareurl: shareurl ?? _shareurl,
  sharecontent: sharecontent ?? _sharecontent,
);
  String? get storyUrl => _storyUrl;
  String? get status => _status;
  num? get priority => _priority;
  bool? get isOffer => _isOffer;
  bool? get isExternalurl => _isExternalurl;
  String? get buttontext => _buttontext;
  dynamic get createdDate => _createdDate;
  dynamic get cta => _cta;
  String? get shareurl => _shareurl;
  String? get sharecontent => _sharecontent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['story_url'] = _storyUrl;
    map['status'] = _status;
    map['priority'] = _priority;
    map['is_offer'] = _isOffer;
    map['is_externalurl'] = _isExternalurl;
    map['buttontext'] = _buttontext;
    map['created_date'] = _createdDate;
    map['cta'] = _cta;
    map['shareurl'] = _shareurl;
    map['sharecontent'] = _sharecontent;
    return map;
  }

}