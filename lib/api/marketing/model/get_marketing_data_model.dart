class GetMarketingDataModel {
  bool? success;
  String? message;
  Data? data;
  String? timestamp;

  GetMarketingDataModel(
      {this.success, this.message, this.data, this.timestamp});

  GetMarketingDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Data {
  Posters? posters;
  Posters? brochures;

  Data({this.posters, this.brochures});

  Data.fromJson(Map<String, dynamic> json) {
    posters =
        json['posters'] != null ? Posters.fromJson(json['posters']) : null;
    brochures =
        json['brochures'] != null ? Posters.fromJson(json['brochures']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posters != null) {
      data['posters'] = posters!.toJson();
    }
    if (brochures != null) {
      data['brochures'] = brochures!.toJson();
    }
    return data;
  }
}

class Posters {
  List<String>? filters;
  List<Categorydata>? categorydata;

  Posters({this.filters, this.categorydata});

  Posters.fromJson(Map<String, dynamic> json) {
    filters = json['filters'].cast<String>();
    if (json['categorydata'] != null) {
      categorydata = <Categorydata>[];
      json['categorydata'].forEach((v) {
        categorydata!.add(Categorydata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filters'] = filters;
    if (categorydata != null) {
      data['categorydata'] = categorydata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categorydata {
  String? categoryname;
  List<Items>? items;

  Categorydata({this.categoryname, this.items});

  Categorydata.fromJson(Map<String, dynamic> json) {
    categoryname = json['categoryname'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryname'] = categoryname;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? title;
  String? shareurl;
  String? logourl;
  String? fileurl;
  String? filetype;
  int? categoryid;
  String? categoryname;
  String? sharecontent;

  Items(
      {this.id,
      this.title,
      this.shareurl,
      this.logourl,
      this.fileurl,
      this.filetype,
      this.categoryid,
      this.categoryname,
      this.sharecontent});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shareurl = json['shareurl'];
    logourl = json['logourl'];
    fileurl = json['fileurl'];
    filetype = json['filetype'];
    categoryid = json['categoryid'];
    categoryname = json['categoryname'];
    sharecontent = json['sharecontent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['shareurl'] = shareurl;
    data['logourl'] = logourl;
    data['fileurl'] = fileurl;
    data['filetype'] = filetype;
    data['categoryid'] = categoryid;
    data['categoryname'] = categoryname;
    data['sharecontent'] = sharecontent;
    return data;
  }
}
