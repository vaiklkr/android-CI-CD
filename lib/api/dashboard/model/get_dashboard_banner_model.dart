class GetDashboardBannerModel {
  bool? success;
  String? message;
  List<Data>? data;
  String? timestamp;

  GetDashboardBannerModel(
      {this.success, this.message, this.data, this.timestamp});

  GetDashboardBannerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Data {
  int? priority;
  String? bannerUrl;
  String? cta;

  Data({this.priority, this.bannerUrl, this.cta});

  Data.fromJson(Map<String, dynamic> json) {
    priority = json['priority'];
    bannerUrl = json['banner_url'];
    cta = json['cta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['priority'] = priority;
    data['banner_url'] = bannerUrl;
    data['cta'] = cta;
    return data;
  }
}
