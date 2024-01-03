// To parse this JSON data, do
//
//     final getMyProfileMenuModel = getMyProfileMenuModelFromJson(jsonString);

// GetMyProfileMenuModel getMyProfileMenuModelFromJson(String str) => GetMyProfileMenuModel.fromJson(json.decode(str));
//
// String getMyProfileMenuModelToJson(GetMyProfileMenuModel data) => json.encode(data.toJson());

// ignore_for_file: constant_identifier_names

class GetMyProfileMenuModel {
  bool? success;
  String? message;
  List<Data>? data;
  String? timestamp;

  GetMyProfileMenuModel(
      {this.success, this.message, this.data, this.timestamp});

  GetMyProfileMenuModel.fromJson(Map<String, dynamic> json) {
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
  int? categoryid;
  String? categoryname;
  bool? showcategoryname;
  String? showcategorynametoshow;
  int? priortity;
  List<Menus>? menus;

  Data(
      {this.categoryid,
      this.categoryname,
      this.showcategoryname,
      this.showcategorynametoshow,
      this.priortity,
      this.menus});

  Data.fromJson(Map<String, dynamic> json) {
    categoryid = json['categoryid'];
    categoryname = json['categoryname'];
    showcategoryname = json['showcategoryname'];
    showcategorynametoshow = json['showcategorynametoshow'];
    priortity = json['priortity'];
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(Menus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryid'] = categoryid;
    data['categoryname'] = categoryname;
    data['showcategoryname'] = showcategoryname;
    data['showcategorynametoshow'] = showcategorynametoshow;
    data['priortity'] = priortity;
    if (menus != null) {
      data['menus'] = menus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menus {
  int? categoryid;
  int? menuid;
  String? categorynametoshow;
  String? menutitle;
  String? menudescription;
  String? iconurl;
  String? cta;
  int? menupriority;

  Menus(
      {this.categoryid,
      this.menuid,
      this.categorynametoshow,
      this.menutitle,
      this.menudescription,
      this.iconurl,
      this.cta,
      this.menupriority});

  Menus.fromJson(Map<String, dynamic> json) {
    categoryid = json['categoryid'];
    menuid = json['menuid'];
    categorynametoshow = json['categorynametoshow'];
    menutitle = json['menutitle'];
    menudescription = json['menudescription'];
    iconurl = json['iconurl'];
    cta = json['cta'];
    menupriority = json['menupriority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryid'] = categoryid;
    data['menuid'] = menuid;
    data['categorynametoshow'] = categorynametoshow;
    data['menutitle'] = menutitle;
    data['menudescription'] = menudescription;
    data['iconurl'] = iconurl;
    data['cta'] = cta;
    data['menupriority'] = menupriority;
    return data;
  }
}
