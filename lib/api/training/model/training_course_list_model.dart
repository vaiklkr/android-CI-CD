class TrainingCourseListModel {
  TrainingCourseListModel({
      bool? success, 
      String? message, 
      List<Data>? data, 
      String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
}

  TrainingCourseListModel.fromJson(dynamic json) {
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
TrainingCourseListModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
  String? timestamp,
}) => TrainingCourseListModel(  success: success ?? _success,
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
      num? courseId, 
      String? courseName, 
      String? description, 
      String? thumbnail, 
      String? videoUrl, 
      String? shareContent, 
      num? fincoinRewards, 
      num? priority,}){
    _courseId = courseId;
    _courseName = courseName;
    _description = description;
    _thumbnail = thumbnail;
    _videoUrl = videoUrl;
    _shareContent = shareContent;
    _fincoinRewards = fincoinRewards;
    _priority = priority;
}

  Data.fromJson(dynamic json) {
    _courseId = json['course_id'];
    _courseName = json['course_name'];
    _description = json['description'];
    _thumbnail = json['thumbnail'];
    _videoUrl = json['video_url'];
    _shareContent = json['share_content'];
    _fincoinRewards = json['fincoin_rewards'];
    _priority = json['priority'];
  }
  num? _courseId;
  String? _courseName;
  String? _description;
  String? _thumbnail;
  String? _videoUrl;
  String? _shareContent;
  num? _fincoinRewards;
  num? _priority;
Data copyWith({  num? courseId,
  String? courseName,
  String? description,
  String? thumbnail,
  String? videoUrl,
  String? shareContent,
  num? fincoinRewards,
  num? priority,
}) => Data(  courseId: courseId ?? _courseId,
  courseName: courseName ?? _courseName,
  description: description ?? _description,
  thumbnail: thumbnail ?? _thumbnail,
  videoUrl: videoUrl ?? _videoUrl,
  shareContent: shareContent ?? _shareContent,
  fincoinRewards: fincoinRewards ?? _fincoinRewards,
  priority: priority ?? _priority,
);
  num? get courseId => _courseId;
  String? get courseName => _courseName;
  String? get description => _description;
  String? get thumbnail => _thumbnail;
  String? get videoUrl => _videoUrl;
  String? get shareContent => _shareContent;
  num? get fincoinRewards => _fincoinRewards;
  num? get priority => _priority;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['course_id'] = _courseId;
    map['course_name'] = _courseName;
    map['description'] = _description;
    map['thumbnail'] = _thumbnail;
    map['video_url'] = _videoUrl;
    map['share_content'] = _shareContent;
    map['fincoin_rewards'] = _fincoinRewards;
    map['priority'] = _priority;
    return map;
  }

}