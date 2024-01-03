class GetFinancialOfferlistModel {
  GetFinancialOfferlistModel({
    bool? success,
    String? message,
    Data? data,
    String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
  }

  GetFinancialOfferlistModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _timestamp = json['timestamp'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  String? _timestamp;
  GetFinancialOfferlistModel copyWith({  bool? success,
    String? message,
    Data? data,
    String? timestamp,
  }) => GetFinancialOfferlistModel(  success: success ?? _success,
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
    bool? issortby,
    bool? isemployemnetfilter,
    bool? isfilters,
    List<String>? filtertags,
    List<Offerdata>? offerdata,}){
    _issortby = issortby;
    _isemployemnetfilter = isemployemnetfilter;
    _isfilters = isfilters;
    _filtertags = filtertags;
    _offerdata = offerdata;
  }

  Data.fromJson(dynamic json) {
    _issortby = json['issortby'];
    _isemployemnetfilter = json['isemployemnetfilter'];
    _isfilters = json['isfilters'];
    _filtertags = json['filtertags'] != null ? json['filtertags'].cast<String>() : [];
    if (json['offerdata'] != null) {
      _offerdata = [];
      json['offerdata'].forEach((v) {
        _offerdata?.add(Offerdata.fromJson(v));
      });
    }
  }
  bool? _issortby;
  bool? _isemployemnetfilter;
  bool? _isfilters;
  List<String>? _filtertags;
  List<Offerdata>? _offerdata;
  Data copyWith({  bool? issortby,
    bool? isemployemnetfilter,
    bool? isfilters,
    List<String>? filtertags,
    List<Offerdata>? offerdata,
  }) => Data(  issortby: issortby ?? _issortby,
    isemployemnetfilter: isemployemnetfilter ?? _isemployemnetfilter,
    isfilters: isfilters ?? _isfilters,
    filtertags: filtertags ?? _filtertags,
    offerdata: offerdata ?? _offerdata,
  );
  bool? get issortby => _issortby;
  bool? get isemployemnetfilter => _isemployemnetfilter;
  bool? get isfilters => _isfilters;
  List<String>? get filtertags => _filtertags;
  List<Offerdata>? get offerdata => _offerdata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['issortby'] = _issortby;
    map['isemployemnetfilter'] = _isemployemnetfilter;
    map['isfilters'] = _isfilters;
    map['filtertags'] = _filtertags;
    if (_offerdata != null) {
      map['offerdata'] = _offerdata?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Offerdata {
  Offerdata({
    num? offerid,
    num? trackierofferid,
    String? offername,
    String? offerdetails,
    String? mainofferurl,
    num? offerprice,
    bool? ispayoutinpercentage,
    List<String>? employmenttype,
    List<String>? tags,
    num? fincoinspayout,
    String? finalgoalname,
    String? logourl,
    String? createdon,
    bool? showfeatures,
    bool? showgoals,
    bool? showmoredetailsbtn,
    bool? showaddcustomerbtn,
    bool? showsharebtn,
    String? feature1Name,
    num? feature1Value,
    String? feature1Valuetext,
    String? feature2Name,
    num? feature2Value,
    String? feature2Valuetext,
    String? feature3Name,
    num? feature3Value,
    String? feature3Valuetext,
    String? moredetailsbtnText,
    String? addcustomerbtnText,
    String? sharebtnText,
    String? goal1Name,
    String? goal1Details,
    String? goal2Name,
    String? goal2Details,
    String? goal3Name,
    String? goal3Details,
    String? goal4Name,
    String? goal4Details,
    String? goal5Name,
    String? goal5Details,
    String? sharecontent,
    String? shareimage,
    List<Goals>? goals,
    String? benefitsLabel,
    String? benefitsContent,
    String? whomtesellLabel,
    String? whomtesellContent,
    String? howitworksLabel,
    String? howitworksContent,
    String? trainingvideoLabel,
    String? trainingvideoUrl,
    String? trainingvideoThmbnail,
    String? termsLabel,
    String? termsContent,
    String? faqsLabel,
    String? faqsContent,
    Creatives? creatives,}){
    _offerid = offerid;
    _trackierofferid = trackierofferid;
    _offername = offername;
    _offerdetails = offerdetails;
    _mainofferurl = mainofferurl;
    _offerprice = offerprice;
    _ispayoutinpercentage = ispayoutinpercentage;
    _employmenttype = employmenttype;
    _tags = tags;
    _fincoinspayout = fincoinspayout;
    _finalgoalname = finalgoalname;
    _logourl = logourl;
    _createdon = createdon;
    _showfeatures = showfeatures;
    _showgoals = showgoals;
    _showmoredetailsbtn = showmoredetailsbtn;
    _showaddcustomerbtn = showaddcustomerbtn;
    _showsharebtn = showsharebtn;
    _feature1Name = feature1Name;
    _feature1Value = feature1Value;
    _feature1Valuetext = feature1Valuetext;
    _feature2Name = feature2Name;
    _feature2Value = feature2Value;
    _feature2Valuetext = feature2Valuetext;
    _feature3Name = feature3Name;
    _feature3Value = feature3Value;
    _feature3Valuetext = feature3Valuetext;
    _moredetailsbtnText = moredetailsbtnText;
    _addcustomerbtnText = addcustomerbtnText;
    _sharebtnText = sharebtnText;
    _goal1Name = goal1Name;
    _goal1Details = goal1Details;
    _goal2Name = goal2Name;
    _goal2Details = goal2Details;
    _goal3Name = goal3Name;
    _goal3Details = goal3Details;
    _goal4Name = goal4Name;
    _goal4Details = goal4Details;
    _goal5Name = goal5Name;
    _goal5Details = goal5Details;
    _sharecontent = sharecontent;
    _shareimage = shareimage;
    _goals = goals;
    _benefitsLabel = benefitsLabel;
    _benefitsContent = benefitsContent;
    _whomtesellLabel = whomtesellLabel;
    _whomtesellContent = whomtesellContent;
    _howitworksLabel = howitworksLabel;
    _howitworksContent = howitworksContent;
    _trainingvideoLabel = trainingvideoLabel;
    _trainingvideoUrl = trainingvideoUrl;
    _trainingvideoThmbnail = trainingvideoThmbnail;
    _termsLabel = termsLabel;
    _termsContent = termsContent;
    _faqsLabel = faqsLabel;
    _faqsContent = faqsContent;
    _creatives = creatives;
  }

  Offerdata.fromJson(dynamic json) {
    _offerid = json['offerid'];
    _trackierofferid = json['trackierofferid'];
    _offername = json['offername'];
    _offerdetails = json['offerdetails'];
    _mainofferurl = json['mainofferurl'];
    _offerprice = json['offerprice'];
    _ispayoutinpercentage = json['ispayoutinpercentage'];
    _employmenttype = json['employmenttype'] != null ? json['employmenttype'].cast<String>() : [];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _fincoinspayout = json['fincoinspayout'];
    _finalgoalname = json['finalgoalname'];
    _logourl = json['logourl'];
    _createdon = json['createdon'];
    _showfeatures = json['showfeatures'];
    _showgoals = json['showgoals'];
    _showmoredetailsbtn = json['showmoredetailsbtn'];
    _showaddcustomerbtn = json['showaddcustomerbtn'];
    _showsharebtn = json['showsharebtn'];
    _feature1Name = json['feature1_name'];
    _feature1Value = json['feature1_value'];
    _feature1Valuetext = json['feature1_valuetext'];
    _feature2Name = json['feature2_name'];
    _feature2Value = json['feature2_value'];
    _feature2Valuetext = json['feature2_valuetext'];
    _feature3Name = json['feature3_name'];
    _feature3Value = json['feature3_value'];
    _feature3Valuetext = json['feature3_valuetext'];
    _moredetailsbtnText = json['moredetailsbtn_text'];
    _addcustomerbtnText = json['addcustomerbtn_text'];
    _sharebtnText = json['sharebtn_text'];
    _goal1Name = json['goal1_name'];
    _goal1Details = json['goal1_details'];
    _goal2Name = json['goal2_name'];
    _goal2Details = json['goal2_details'];
    _goal3Name = json['goal3_name'];
    _goal3Details = json['goal3_details'];
    _goal4Name = json['goal4_name'];
    _goal4Details = json['goal4_details'];
    _goal5Name = json['goal5_name'];
    _goal5Details = json['goal5_details'];
    _sharecontent = json['sharecontent'];
    _shareimage = json['shareimage'];
    if (json['goals'] != null) {
      _goals = [];
      json['goals'].forEach((v) {
        _goals?.add(Goals.fromJson(v));
      });
    }
    _benefitsLabel = json['benefits_label'];
    _benefitsContent = json['benefits_content'];
    _whomtesellLabel = json['whomtesell_label'];
    _whomtesellContent = json['whomtesell_content'];
    _howitworksLabel = json['howitworks_label'];
    _howitworksContent = json['howitworks_content'];
    _trainingvideoLabel = json['trainingvideo_label'];
    _trainingvideoUrl = json['trainingvideo_url'];
    _trainingvideoThmbnail = json['trainingvideo_thmbnail'];
    _termsLabel = json['terms_label'];
    _termsContent = json['terms_content'];
    _faqsLabel = json['faqs_label'];
    _faqsContent = json['faqs_content'];
    _creatives = json['creatives'] != null ? Creatives.fromJson(json['creatives']) : null;
  }
  num? _offerid;
  num? _trackierofferid;
  String? _offername;
  String? _offerdetails;
  String? _mainofferurl;
  num? _offerprice;
  bool? _ispayoutinpercentage;
  List<String>? _employmenttype;
  List<String>? _tags;
  num? _fincoinspayout;
  String? _finalgoalname;
  String? _logourl;
  String? _createdon;
  bool? _showfeatures;
  bool? _showgoals;
  bool? _showmoredetailsbtn;
  bool? _showaddcustomerbtn;
  bool? _showsharebtn;
  String? _feature1Name;
  num? _feature1Value;
  String? _feature1Valuetext;
  String? _feature2Name;
  num? _feature2Value;
  String? _feature2Valuetext;
  String? _feature3Name;
  num? _feature3Value;
  String? _feature3Valuetext;
  String? _moredetailsbtnText;
  String? _addcustomerbtnText;
  String? _sharebtnText;
  String? _goal1Name;
  String? _goal1Details;
  String? _goal2Name;
  String? _goal2Details;
  String? _goal3Name;
  String? _goal3Details;
  String? _goal4Name;
  String? _goal4Details;
  String? _goal5Name;
  String? _goal5Details;
  String? _sharecontent;
  String? _shareimage;
  List<Goals>? _goals;
  String? _benefitsLabel;
  String? _benefitsContent;
  String? _whomtesellLabel;
  String? _whomtesellContent;
  String? _howitworksLabel;
  String? _howitworksContent;
  String? _trainingvideoLabel;
  String? _trainingvideoUrl;
  String? _trainingvideoThmbnail;
  String? _termsLabel;
  String? _termsContent;
  String? _faqsLabel;
  String? _faqsContent;
  Creatives? _creatives;
  Offerdata copyWith({  num? offerid,
    num? trackierofferid,
    String? offername,
    String? offerdetails,
    String? mainofferurl,
    num? offerprice,
    bool? ispayoutinpercentage,
    List<String>? employmenttype,
    List<String>? tags,
    num? fincoinspayout,
    String? finalgoalname,
    String? logourl,
    String? createdon,
    bool? showfeatures,
    bool? showgoals,
    bool? showmoredetailsbtn,
    bool? showaddcustomerbtn,
    bool? showsharebtn,
    String? feature1Name,
    num? feature1Value,
    String? feature1Valuetext,
    String? feature2Name,
    num? feature2Value,
    String? feature2Valuetext,
    String? feature3Name,
    num? feature3Value,
    String? feature3Valuetext,
    String? moredetailsbtnText,
    String? addcustomerbtnText,
    String? sharebtnText,
    String? goal1Name,
    String? goal1Details,
    String? goal2Name,
    String? goal2Details,
    String? goal3Name,
    String? goal3Details,
    String? goal4Name,
    String? goal4Details,
    String? goal5Name,
    String? goal5Details,
    String? sharecontent,
    String? shareimage,
    List<Goals>? goals,
    String? benefitsLabel,
    String? benefitsContent,
    String? whomtesellLabel,
    String? whomtesellContent,
    String? howitworksLabel,
    String? howitworksContent,
    String? trainingvideoLabel,
    String? trainingvideoUrl,
    String? trainingvideoThmbnail,
    String? termsLabel,
    String? termsContent,
    String? faqsLabel,
    String? faqsContent,
    Creatives? creatives,
  }) => Offerdata(  offerid: offerid ?? _offerid,
    trackierofferid: trackierofferid ?? _trackierofferid,
    offername: offername ?? _offername,
    offerdetails: offerdetails ?? _offerdetails,
    mainofferurl: mainofferurl ?? _mainofferurl,
    offerprice: offerprice ?? _offerprice,
    ispayoutinpercentage: ispayoutinpercentage ?? _ispayoutinpercentage,
    employmenttype: employmenttype ?? _employmenttype,
    tags: tags ?? _tags,
    fincoinspayout: fincoinspayout ?? _fincoinspayout,
    finalgoalname: finalgoalname ?? _finalgoalname,
    logourl: logourl ?? _logourl,
    createdon: createdon ?? _createdon,
    showfeatures: showfeatures ?? _showfeatures,
    showgoals: showgoals ?? _showgoals,
    showmoredetailsbtn: showmoredetailsbtn ?? _showmoredetailsbtn,
    showaddcustomerbtn: showaddcustomerbtn ?? _showaddcustomerbtn,
    showsharebtn: showsharebtn ?? _showsharebtn,
    feature1Name: feature1Name ?? _feature1Name,
    feature1Value: feature1Value ?? _feature1Value,
    feature1Valuetext: feature1Valuetext ?? _feature1Valuetext,
    feature2Name: feature2Name ?? _feature2Name,
    feature2Value: feature2Value ?? _feature2Value,
    feature2Valuetext: feature2Valuetext ?? _feature2Valuetext,
    feature3Name: feature3Name ?? _feature3Name,
    feature3Value: feature3Value ?? _feature3Value,
    feature3Valuetext: feature3Valuetext ?? _feature3Valuetext,
    moredetailsbtnText: moredetailsbtnText ?? _moredetailsbtnText,
    addcustomerbtnText: addcustomerbtnText ?? _addcustomerbtnText,
    sharebtnText: sharebtnText ?? _sharebtnText,
    goal1Name: goal1Name ?? _goal1Name,
    goal1Details: goal1Details ?? _goal1Details,
    goal2Name: goal2Name ?? _goal2Name,
    goal2Details: goal2Details ?? _goal2Details,
    goal3Name: goal3Name ?? _goal3Name,
    goal3Details: goal3Details ?? _goal3Details,
    goal4Name: goal4Name ?? _goal4Name,
    goal4Details: goal4Details ?? _goal4Details,
    goal5Name: goal5Name ?? _goal5Name,
    goal5Details: goal5Details ?? _goal5Details,
    sharecontent: sharecontent ?? _sharecontent,
    shareimage: shareimage ?? _shareimage,
    goals: goals ?? _goals,
    benefitsLabel: benefitsLabel ?? _benefitsLabel,
    benefitsContent: benefitsContent ?? _benefitsContent,
    whomtesellLabel: whomtesellLabel ?? _whomtesellLabel,
    whomtesellContent: whomtesellContent ?? _whomtesellContent,
    howitworksLabel: howitworksLabel ?? _howitworksLabel,
    howitworksContent: howitworksContent ?? _howitworksContent,
    trainingvideoLabel: trainingvideoLabel ?? _trainingvideoLabel,
    trainingvideoUrl: trainingvideoUrl ?? _trainingvideoUrl,
    trainingvideoThmbnail: trainingvideoThmbnail ?? _trainingvideoThmbnail,
    termsLabel: termsLabel ?? _termsLabel,
    termsContent: termsContent ?? _termsContent,
    faqsLabel: faqsLabel ?? _faqsLabel,
    faqsContent: faqsContent ?? _faqsContent,
    creatives: creatives ?? _creatives,
  );
  num? get offerid => _offerid;
  num? get trackierofferid => _trackierofferid;
  String? get offername => _offername;
  String? get offerdetails => _offerdetails;
  String? get mainofferurl => _mainofferurl;
  num? get offerprice => _offerprice;
  bool? get ispayoutinpercentage => _ispayoutinpercentage;
  List<String>? get employmenttype => _employmenttype;
  List<String>? get tags => _tags;
  num? get fincoinspayout => _fincoinspayout;
  String? get finalgoalname => _finalgoalname;
  String? get logourl => _logourl;
  String? get createdon => _createdon;
  bool? get showfeatures => _showfeatures;
  bool? get showgoals => _showgoals;
  bool? get showmoredetailsbtn => _showmoredetailsbtn;
  bool? get showaddcustomerbtn => _showaddcustomerbtn;
  bool? get showsharebtn => _showsharebtn;
  String? get feature1Name => _feature1Name;
  num? get feature1Value => _feature1Value;
  String? get feature1Valuetext => _feature1Valuetext;
  String? get feature2Name => _feature2Name;
  num? get feature2Value => _feature2Value;
  String? get feature2Valuetext => _feature2Valuetext;
  String? get feature3Name => _feature3Name;
  num? get feature3Value => _feature3Value;
  String? get feature3Valuetext => _feature3Valuetext;
  String? get moredetailsbtnText => _moredetailsbtnText;
  String? get addcustomerbtnText => _addcustomerbtnText;
  String? get sharebtnText => _sharebtnText;
  String? get goal1Name => _goal1Name;
  String? get goal1Details => _goal1Details;
  String? get goal2Name => _goal2Name;
  String? get goal2Details => _goal2Details;
  String? get goal3Name => _goal3Name;
  String? get goal3Details => _goal3Details;
  String? get goal4Name => _goal4Name;
  String? get goal4Details => _goal4Details;
  String? get goal5Name => _goal5Name;
  String? get goal5Details => _goal5Details;
  String? get sharecontent => _sharecontent;
  String? get shareimage => _shareimage;
  List<Goals>? get goals => _goals;
  String? get benefitsLabel => _benefitsLabel;
  String? get benefitsContent => _benefitsContent;
  String? get whomtesellLabel => _whomtesellLabel;
  String? get whomtesellContent => _whomtesellContent;
  String? get howitworksLabel => _howitworksLabel;
  String? get howitworksContent => _howitworksContent;
  String? get trainingvideoLabel => _trainingvideoLabel;
  String? get trainingvideoUrl => _trainingvideoUrl;
  String? get trainingvideoThmbnail => _trainingvideoThmbnail;
  String? get termsLabel => _termsLabel;
  String? get termsContent => _termsContent;
  String? get faqsLabel => _faqsLabel;
  String? get faqsContent => _faqsContent;
  Creatives? get creatives => _creatives;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offerid'] = _offerid;
    map['trackierofferid'] = _trackierofferid;
    map['offername'] = _offername;
    map['offerdetails'] = _offerdetails;
    map['mainofferurl'] = _mainofferurl;
    map['offerprice'] = _offerprice;
    map['ispayoutinpercentage'] = _ispayoutinpercentage;
    map['employmenttype'] = _employmenttype;
    map['tags'] = _tags;
    map['fincoinspayout'] = _fincoinspayout;
    map['finalgoalname'] = _finalgoalname;
    map['logourl'] = _logourl;
    map['createdon'] = _createdon;
    map['showfeatures'] = _showfeatures;
    map['showgoals'] = _showgoals;
    map['showmoredetailsbtn'] = _showmoredetailsbtn;
    map['showaddcustomerbtn'] = _showaddcustomerbtn;
    map['showsharebtn'] = _showsharebtn;
    map['feature1_name'] = _feature1Name;
    map['feature1_value'] = _feature1Value;
    map['feature1_valuetext'] = _feature1Valuetext;
    map['feature2_name'] = _feature2Name;
    map['feature2_value'] = _feature2Value;
    map['feature2_valuetext'] = _feature2Valuetext;
    map['feature3_name'] = _feature3Name;
    map['feature3_value'] = _feature3Value;
    map['feature3_valuetext'] = _feature3Valuetext;
    map['moredetailsbtn_text'] = _moredetailsbtnText;
    map['addcustomerbtn_text'] = _addcustomerbtnText;
    map['sharebtn_text'] = _sharebtnText;
    map['goal1_name'] = _goal1Name;
    map['goal1_details'] = _goal1Details;
    map['goal2_name'] = _goal2Name;
    map['goal2_details'] = _goal2Details;
    map['goal3_name'] = _goal3Name;
    map['goal3_details'] = _goal3Details;
    map['goal4_name'] = _goal4Name;
    map['goal4_details'] = _goal4Details;
    map['goal5_name'] = _goal5Name;
    map['goal5_details'] = _goal5Details;
    map['sharecontent'] = _sharecontent;
    map['shareimage'] = _shareimage;
    if (_goals != null) {
      map['goals'] = _goals?.map((v) => v.toJson()).toList();
    }
    map['benefits_label'] = _benefitsLabel;
    map['benefits_content'] = _benefitsContent;
    map['whomtesell_label'] = _whomtesellLabel;
    map['whomtesell_content'] = _whomtesellContent;
    map['howitworks_label'] = _howitworksLabel;
    map['howitworks_content'] = _howitworksContent;
    map['trainingvideo_label'] = _trainingvideoLabel;
    map['trainingvideo_url'] = _trainingvideoUrl;
    map['trainingvideo_thmbnail'] = _trainingvideoThmbnail;
    map['terms_label'] = _termsLabel;
    map['terms_content'] = _termsContent;
    map['faqs_label'] = _faqsLabel;
    map['faqs_content'] = _faqsContent;
    if (_creatives != null) {
      map['creatives'] = _creatives?.toJson();
    }
    return map;
  }

}

class Creatives {
  Creatives({
    List<String>? banners,
    List<String>? photos,
    List<String>? videos,
    List<String>? brochures,}){
    _banners = banners;
    _photos = photos;
    _videos = videos;
    _brochures = brochures;
  }

  Creatives.fromJson(dynamic json) {
    _banners = json['banners'] != null ? json['banners'].cast<String>() : [];
    _photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    _videos = json['videos'] != null ? json['videos'].cast<String>() : [];
    _brochures = json['brochures'] != null ? json['brochures'].cast<String>() : [];
  }
  List<String>? _banners;
  List<String>? _photos;
  List<String>? _videos;
  List<String>? _brochures;
  Creatives copyWith({  List<String>? banners,
    List<String>? photos,
    List<String>? videos,
    List<String>? brochures,
  }) => Creatives(  banners: banners ?? _banners,
    photos: photos ?? _photos,
    videos: videos ?? _videos,
    brochures: brochures ?? _brochures,
  );
  List<String>? get banners => _banners;
  List<String>? get photos => _photos;
  List<String>? get videos => _videos;
  List<String>? get brochures => _brochures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['banners'] = _banners;
    map['photos'] = _photos;
    map['videos'] = _videos;
    map['brochures'] = _brochures;
    return map;
  }

}

class Goals {
  Goals({
    num? goalid,
    String? goalname,
    String? goaldescription,
    num? goalprice,
    num? goalfincoins,}){
    _goalid = goalid;
    _goalname = goalname;
    _goaldescription = goaldescription;
    _goalprice = goalprice;
    _goalfincoins = goalfincoins;
  }

  Goals.fromJson(dynamic json) {
    _goalid = json['goalid'];
    _goalname = json['goalname'];
    _goaldescription = json['goaldescription'];
    _goalprice = json['goalprice'];
    _goalfincoins = json['goalfincoins'];
  }
  num? _goalid;
  String? _goalname;
  String? _goaldescription;
  num? _goalprice;
  num? _goalfincoins;
  Goals copyWith({  num? goalid,
    String? goalname,
    String? goaldescription,
    num? goalprice,
    num? goalfincoins,
  }) => Goals(  goalid: goalid ?? _goalid,
    goalname: goalname ?? _goalname,
    goaldescription: goaldescription ?? _goaldescription,
    goalprice: goalprice ?? _goalprice,
    goalfincoins: goalfincoins ?? _goalfincoins,
  );
  num? get goalid => _goalid;
  String? get goalname => _goalname;
  String? get goaldescription => _goaldescription;
  num? get goalprice => _goalprice;
  num? get goalfincoins => _goalfincoins;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['goalid'] = _goalid;
    map['goalname'] = _goalname;
    map['goaldescription'] = _goaldescription;
    map['goalprice'] = _goalprice;
    map['goalfincoins'] = _goalfincoins;
    return map;
  }

}