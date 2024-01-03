/// success : false
/// message : ""
/// data : {"offerId":0,"details":{"offerId":2,"banner":["https://example.com/banner1.jpg","https://example.com/banner2.jpg"],"benefits":"💰 10% Cashback on Swiggy Spends (up to ₹1500)*\n💻 5% Cashback on Online spends (up to ₹1500)*\n🤩 Free 3 month Swiggy One membership worth ₹1199*\n🏌🏻‍♂️ Access to golf courses worldwide & 12 free lessons/year\nClick here:","whomToSell":"Whom to sell 1","trainingVideo":"https://example.com/video2.mp4","termsAndCondition":"Terms 1","faqs":[{"question":"FAQ 1","answer":"Answer 1"},{"question":"FAQ 2","answer":"Answer 2"},{"question":"FAQ 3","answer":"Answer 3"},{"question":"FAQ 3","answer":"Answer 3"}]},"shareContent":null,"earnings":null}
/// timestamp : "2023-11-28T12:46:17.2684985Z"

class GetFinancialOfferDetailModel {
  GetFinancialOfferDetailModel({
      bool? success, 
      String? message, 
      Data? data, 
      String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
}

  GetFinancialOfferDetailModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _timestamp = json['timestamp'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  String? _timestamp;
GetFinancialOfferDetailModel copyWith({  bool? success,
  String? message,
  Data? data,
  String? timestamp,
}) => GetFinancialOfferDetailModel(  success: success ?? _success,
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

/// offerId : 0
/// details : {"offerId":2,"banner":["https://example.com/banner1.jpg","https://example.com/banner2.jpg"],"benefits":"💰 10% Cashback on Swiggy Spends (up to ₹1500)*\n💻 5% Cashback on Online spends (up to ₹1500)*\n🤩 Free 3 month Swiggy One membership worth ₹1199*\n🏌🏻‍♂️ Access to golf courses worldwide & 12 free lessons/year\nClick here:","whomToSell":"Whom to sell 1","trainingVideo":"https://example.com/video2.mp4","termsAndCondition":"Terms 1","faqs":[{"question":"FAQ 1","answer":"Answer 1"},{"question":"FAQ 2","answer":"Answer 2"},{"question":"FAQ 3","answer":"Answer 3"},{"question":"FAQ 3","answer":"Answer 3"}]}
/// shareContent : null
/// earnings : null

class Data {
  Data({
      num? offerId, 
      Details? details, 
      dynamic shareContent, 
      dynamic earnings,}){
    _offerId = offerId;
    _details = details;
    _shareContent = shareContent;
    _earnings = earnings;
}

  Data.fromJson(dynamic json) {
    _offerId = json['offerId'];
    _details = json['details'] != null ? Details.fromJson(json['details']) : null;
    _shareContent = json['shareContent'];
    _earnings = json['earnings'];
  }
  num? _offerId;
  Details? _details;
  dynamic _shareContent;
  dynamic _earnings;
Data copyWith({  num? offerId,
  Details? details,
  dynamic shareContent,
  dynamic earnings,
}) => Data(  offerId: offerId ?? _offerId,
  details: details ?? _details,
  shareContent: shareContent ?? _shareContent,
  earnings: earnings ?? _earnings,
);
  num? get offerId => _offerId;
  Details? get details => _details;
  dynamic get shareContent => _shareContent;
  dynamic get earnings => _earnings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offerId'] = _offerId;
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    map['shareContent'] = _shareContent;
    map['earnings'] = _earnings;
    return map;
  }

}

/// offerId : 2
/// banner : ["https://example.com/banner1.jpg","https://example.com/banner2.jpg"]
/// benefits : "💰 10% Cashback on Swiggy Spends (up to ₹1500)*\n💻 5% Cashback on Online spends (up to ₹1500)*\n🤩 Free 3 month Swiggy One membership worth ₹1199*\n🏌🏻‍♂️ Access to golf courses worldwide & 12 free lessons/year\nClick here:"
/// whomToSell : "Whom to sell 1"
/// trainingVideo : "https://example.com/video2.mp4"
/// termsAndCondition : "Terms 1"
/// faqs : [{"question":"FAQ 1","answer":"Answer 1"},{"question":"FAQ 2","answer":"Answer 2"},{"question":"FAQ 3","answer":"Answer 3"},{"question":"FAQ 3","answer":"Answer 3"}]

class Details {
  Details({
      num? offerId, 
      List<String>? banner, 
      String? benefits, 
      String? whomToSell, 
      String? trainingVideo, 
      String? termsAndCondition, 
      List<Faqs>? faqs,}){
    _offerId = offerId;
    _banner = banner;
    _benefits = benefits;
    _whomToSell = whomToSell;
    _trainingVideo = trainingVideo;
    _termsAndCondition = termsAndCondition;
    _faqs = faqs;
}

  Details.fromJson(dynamic json) {
    _offerId = json['offerId'];
    _banner = json['banner'] != null ? json['banner'].cast<String>() : [];
    _benefits = json['benefits'];
    _whomToSell = json['whomToSell'];
    _trainingVideo = json['trainingVideo'];
    _termsAndCondition = json['termsAndCondition'];
    if (json['faqs'] != null) {
      _faqs = [];
      json['faqs'].forEach((v) {
        _faqs?.add(Faqs.fromJson(v));
      });
    }
  }
  num? _offerId;
  List<String>? _banner;
  String? _benefits;
  String? _whomToSell;
  String? _trainingVideo;
  String? _termsAndCondition;
  List<Faqs>? _faqs;
Details copyWith({  num? offerId,
  List<String>? banner,
  String? benefits,
  String? whomToSell,
  String? trainingVideo,
  String? termsAndCondition,
  List<Faqs>? faqs,
}) => Details(  offerId: offerId ?? _offerId,
  banner: banner ?? _banner,
  benefits: benefits ?? _benefits,
  whomToSell: whomToSell ?? _whomToSell,
  trainingVideo: trainingVideo ?? _trainingVideo,
  termsAndCondition: termsAndCondition ?? _termsAndCondition,
  faqs: faqs ?? _faqs,
);
  num? get offerId => _offerId;
  List<String>? get banner => _banner;
  String? get benefits => _benefits;
  String? get whomToSell => _whomToSell;
  String? get trainingVideo => _trainingVideo;
  String? get termsAndCondition => _termsAndCondition;
  List<Faqs>? get faqs => _faqs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offerId'] = _offerId;
    map['banner'] = _banner;
    map['benefits'] = _benefits;
    map['whomToSell'] = _whomToSell;
    map['trainingVideo'] = _trainingVideo;
    map['termsAndCondition'] = _termsAndCondition;
    if (_faqs != null) {
      map['faqs'] = _faqs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// question : "FAQ 1"
/// answer : "Answer 1"

class Faqs {
  Faqs({
      String? question, 
      String? answer,}){
    _question = question;
    _answer = answer;
}

  Faqs.fromJson(dynamic json) {
    _question = json['question'];
    _answer = json['answer'];
  }
  String? _question;
  String? _answer;
Faqs copyWith({  String? question,
  String? answer,
}) => Faqs(  question: question ?? _question,
  answer: answer ?? _answer,
);
  String? get question => _question;
  String? get answer => _answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = _question;
    map['answer'] = _answer;
    return map;
  }

}