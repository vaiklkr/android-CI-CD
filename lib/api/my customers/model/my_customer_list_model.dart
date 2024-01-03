class MyCustomerListModel {
  bool? success;
  String? message;
  Data? data;
  String? timestamp;

  MyCustomerListModel(
      {this.success, this.message, this.data, this.timestamp});

  MyCustomerListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Data {
  List<Filters>? filters;
  List<Details>? details;

  Data({this.filters, this.details});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['filters'] != null) {
      filters = <Filters>[];
      json['filters'].forEach((v) {
        filters!.add(new Filters.fromJson(v));
      });
    }
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filters != null) {
      data['filters'] = this.filters!.map((v) => v.toJson()).toList();
    }
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Filters {
  int? categoryid;
  String? categoryname;

  Filters({this.categoryid, this.categoryname});

  Filters.fromJson(Map<String, dynamic> json) {
    categoryid = json['categoryid'];
    categoryname = json['categoryname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryid'] = this.categoryid;
    data['categoryname'] = this.categoryname;
    return data;
  }
}

class Details {
  String? customername;
  String? mobilenumber;
  int? categoryid;
  String? categoryname;
  int? offerid;
  String? offername;
  String? offerlogourl;
  String? leadstatus;
  String? leadstartdate;
  String? sharecontent;
  String? shareurl;
  String? comments;

  Details(
      {this.customername,
        this.mobilenumber,
        this.categoryid,
        this.categoryname,
        this.offerid,
        this.offername,
        this.offerlogourl,
        this.leadstatus,
        this.leadstartdate,
        this.sharecontent,
        this.shareurl,
        this.comments});

  Details.fromJson(Map<String, dynamic> json) {
    customername = json['customername'];
    mobilenumber = json['mobilenumber'];
    categoryid = json['categoryid'];
    categoryname = json['categoryname'];
    offerid = json['offerid'];
    offername = json['offername'];
    offerlogourl = json['offerlogourl'];
    leadstatus = json['leadstatus'];
    leadstartdate = json['leadstartdate'];
    sharecontent = json['sharecontent'];
    shareurl = json['shareurl'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customername'] = this.customername;
    data['mobilenumber'] = this.mobilenumber;
    data['categoryid'] = this.categoryid;
    data['categoryname'] = this.categoryname;
    data['offerid'] = this.offerid;
    data['offername'] = this.offername;
    data['offerlogourl'] = this.offerlogourl;
    data['leadstatus'] = this.leadstatus;
    data['leadstartdate'] = this.leadstartdate;
    data['sharecontent'] = this.sharecontent;
    data['shareurl'] = this.shareurl;
    data['comments'] = this.comments;
    return data;
  }
}
