/// success : true
/// message : ""
/// data : [{"sectionid":null,"categoryid":2,"category_type":"Credit Line","description":"","priority":1,"icon_url":"https://finjoyapp.com/images/i2.png","highlight_text":"Best Seller","cta":"","knowmorebutton":"","bgimage":"https://finjoyapp.com/images/headerbg.png","layout_type":"single"},{"sectionid":null,"categoryid":1,"category_type":"Credit Card","description":"Earn 3500","priority":2,"icon_url":"https://finjoyapp.com/images/i1.png","highlight_text":"Best Seller","cta":"","knowmorebutton":"","bgimage":"https://finjoyapp.com/images/headerbg.png","layout_type":"single"},{"sectionid":null,"categoryid":3,"category_type":"Savings Account","description":"Savings Account","priority":3,"icon_url":"https://finjoyapp.com/images/i4.png","highlight_text":"","cta":"","knowmorebutton":"","bgimage":"https://finjoyapp.com/images/headerbg.png","layout_type":"single"},{"sectionid":null,"categoryid":4,"category_type":"Financing","description":"Earn 2500","priority":4,"icon_url":"https://finjoyapp.com/images/i3.png","highlight_text":"Best Seller","cta":"","knowmorebutton":"","bgimage":"https://finjoyapp.com/images/headerbg.png","layout_type":"single"},{"sectionid":null,"categoryid":5,"category_type":"Demat A/C","description":"Earn 2500","priority":5,"icon_url":"https://finjoy-app-bucket.s3.amazonaws.com/Demat A/C/graph_svgrepo.com.png","highlight_text":"","cta":"","knowmorebutton":"","bgimage":"https://finjoyapp.com/images/headerbg.png","layout_type":"single"},{"sectionid":null,"categoryid":6,"category_type":"Personal Loan","description":"Personal Loan","priority":6,"icon_url":"https://finjoy-app-bucket.s3.amazonaws.com/Personal Loan/saving_svgrepo.com.png","highlight_text":"Best Seller","cta":"","knowmorebutton":"","bgimage":"https://finjoyapp.com/images/headerbg.png","layout_type":"single"}]
/// timestamp : "2023-12-11T08:50:32.7786329Z"

class GetSellAndEarnDataModel {
  GetSellAndEarnDataModel({
    bool? success,
    String? message,
    List<Data>? data,
    String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
  }

  GetSellAndEarnDataModel.fromJson(dynamic json) {
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
  GetSellAndEarnDataModel copyWith({  bool? success,
    String? message,
    List<Data>? data,
    String? timestamp,
  }) => GetSellAndEarnDataModel(  success: success ?? _success,
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

/// sectionid : null
/// categoryid : 2
/// category_type : "Credit Line"
/// description : ""
/// priority : 1
/// icon_url : "https://finjoyapp.com/images/i2.png"
/// highlight_text : "Best Seller"
/// cta : ""
/// knowmorebutton : ""
/// bgimage : "https://finjoyapp.com/images/headerbg.png"
/// layout_type : "single"

class Data {
  Data({
    dynamic sectionid,
    num? categoryid,
    String? categoryType,
    String? description,
    num? priority,
    String? iconUrl,
    String? highlightText,
    String? cta,
    String? knowmorebutton,
    String? bgimage,
    String? layoutType,}){
    _sectionid = sectionid;
    _categoryid = categoryid;
    _categoryType = categoryType;
    _description = description;
    _priority = priority;
    _iconUrl = iconUrl;
    _highlightText = highlightText;
    _cta = cta;
    _knowmorebutton = knowmorebutton;
    _bgimage = bgimage;
    _layoutType = layoutType;
  }

  Data.fromJson(dynamic json) {
    _sectionid = json['sectionid'];
    _categoryid = json['categoryid'];
    _categoryType = json['category_type'];
    _description = json['description'];
    _priority = json['priority'];
    _iconUrl = json['icon_url'];
    _highlightText = json['highlight_text'];
    _cta = json['cta'];
    _knowmorebutton = json['knowmorebutton'];
    _bgimage = json['bgimage'];
    _layoutType = json['layout_type'];
  }
  dynamic _sectionid;
  num? _categoryid;
  String? _categoryType;
  String? _description;
  num? _priority;
  String? _iconUrl;
  String? _highlightText;
  String? _cta;
  String? _knowmorebutton;
  String? _bgimage;
  String? _layoutType;
  Data copyWith({  dynamic sectionid,
    num? categoryid,
    String? categoryType,
    String? description,
    num? priority,
    String? iconUrl,
    String? highlightText,
    String? cta,
    String? knowmorebutton,
    String? bgimage,
    String? layoutType,
  }) => Data(  sectionid: sectionid ?? _sectionid,
    categoryid: categoryid ?? _categoryid,
    categoryType: categoryType ?? _categoryType,
    description: description ?? _description,
    priority: priority ?? _priority,
    iconUrl: iconUrl ?? _iconUrl,
    highlightText: highlightText ?? _highlightText,
    cta: cta ?? _cta,
    knowmorebutton: knowmorebutton ?? _knowmorebutton,
    bgimage: bgimage ?? _bgimage,
    layoutType: layoutType ?? _layoutType,
  );
  dynamic get sectionid => _sectionid;
  num? get categoryid => _categoryid;
  String? get categoryType => _categoryType;
  String? get description => _description;
  num? get priority => _priority;
  String? get iconUrl => _iconUrl;
  String? get highlightText => _highlightText;
  String? get cta => _cta;
  String? get knowmorebutton => _knowmorebutton;
  String? get bgimage => _bgimage;
  String? get layoutType => _layoutType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sectionid'] = _sectionid;
    map['categoryid'] = _categoryid;
    map['category_type'] = _categoryType;
    map['description'] = _description;
    map['priority'] = _priority;
    map['icon_url'] = _iconUrl;
    map['highlight_text'] = _highlightText;
    map['cta'] = _cta;
    map['knowmorebutton'] = _knowmorebutton;
    map['bgimage'] = _bgimage;
    map['layout_type'] = _layoutType;
    return map;
  }

}