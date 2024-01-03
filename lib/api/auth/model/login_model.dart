class LoginModel {
  LoginModel({
      bool? success, 
      String? message, 
      Data? data, 
      String? timestamp,}){
    _success = success;
    _message = message;
    _data = data;
    _timestamp = timestamp;
}

  LoginModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _timestamp = json['timestamp'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  String? _timestamp;
LoginModel copyWith({  bool? success,
  String? message,
  Data? data,
  String? timestamp,
}) => LoginModel(  success: success ?? _success,
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
      num? id, 
      String? userID, 
      String? mobileNumber, 
      bool? isMobileNumberVerified, 
      String? name, 
      String? emailID, 
      bool? isEmailIDVerified, 
      String? registrationTime, 
      String? gender, 
      String? otp, 
      String? otpExpirationTime, 
      String? iconURL, 
      String? emailOTP, 
      String? emailOTPExpirationTime, 
      String? token, 
      String? tokenExpirationTime, 
      num? languageID, 
      String? language, 
      String? occupation, 
      String? qualification, 
      String? income, 
      String? dob, 
      num? pincode, 
      String? city, 
      String? district, 
      String? state, 
      String? referralCode, 
      String? mpin, 
      bool? isUserValid, 
      bool? optinforWhatsapp, 
      String? myStoreUrl, 
      String? finID, 
      bool? isPersonalDetailsAdded, 
      bool? isPanKYCCompleted, 
      bool? isAadhaarKYCCompleted,}){
    _id = id;
    _userID = userID;
    _mobileNumber = mobileNumber;
    _isMobileNumberVerified = isMobileNumberVerified;
    _name = name;
    _emailID = emailID;
    _isEmailIDVerified = isEmailIDVerified;
    _registrationTime = registrationTime;
    _gender = gender;
    _otp = otp;
    _otpExpirationTime = otpExpirationTime;
    _iconURL = iconURL;
    _emailOTP = emailOTP;
    _emailOTPExpirationTime = emailOTPExpirationTime;
    _token = token;
    _tokenExpirationTime = tokenExpirationTime;
    _languageID = languageID;
    _language = language;
    _occupation = occupation;
    _qualification = qualification;
    _income = income;
    _dob = dob;
    _pincode = pincode;
    _city = city;
    _district = district;
    _state = state;
    _referralCode = referralCode;
    _mpin = mpin;
    _isUserValid = isUserValid;
    _optinforWhatsapp = optinforWhatsapp;
    _myStoreUrl = myStoreUrl;
    _finID = finID;
    _isPersonalDetailsAdded = isPersonalDetailsAdded;
    _isPanKYCCompleted = isPanKYCCompleted;
    _isAadhaarKYCCompleted = isAadhaarKYCCompleted;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userID = json['userID'];
    _mobileNumber = json['mobileNumber'];
    _isMobileNumberVerified = json['isMobileNumberVerified'];
    _name = json['name'];
    _emailID = json['emailID'];
    _isEmailIDVerified = json['isEmailIDVerified'];
    _registrationTime = json['registrationTime'];
    _gender = json['gender'];
    _otp = json['otp'];
    _otpExpirationTime = json['otpExpirationTime'];
    _iconURL = json['iconURL'];
    _emailOTP = json['emailOTP'];
    _emailOTPExpirationTime = json['emailOTPExpirationTime'];
    _token = json['token'];
    _tokenExpirationTime = json['tokenExpirationTime'];
    _languageID = json['languageID'];
    _language = json['language'];
    _occupation = json['occupation'];
    _qualification = json['qualification'];
    _income = json['income'];
    _dob = json['dob'];
    _pincode = json['pincode'];
    _city = json['city'];
    _district = json['district'];
    _state = json['state'];
    _referralCode = json['referralCode'];
    _mpin = json['mpin'];
    _isUserValid = json['isUserValid'];
    _optinforWhatsapp = json['optinforWhatsapp'];
    _myStoreUrl = json['myStoreUrl'];
    _finID = json['finID'];
    _isPersonalDetailsAdded = json['isPersonalDetailsAdded'];
    _isPanKYCCompleted = json['isPanKYCCompleted'];
    _isAadhaarKYCCompleted = json['isAadhaarKYCCompleted'];
  }
  num? _id;
  String? _userID;
  String? _mobileNumber;
  bool? _isMobileNumberVerified;
  String? _name;
  String? _emailID;
  bool? _isEmailIDVerified;
  String? _registrationTime;
  String? _gender;
  String? _otp;
  String? _otpExpirationTime;
  String? _iconURL;
  String? _emailOTP;
  String? _emailOTPExpirationTime;
  String? _token;
  String? _tokenExpirationTime;
  num? _languageID;
  String? _language;
  String? _occupation;
  String? _qualification;
  String? _income;
  String? _dob;
  num? _pincode;
  String? _city;
  String? _district;
  String? _state;
  String? _referralCode;
  String? _mpin;
  bool? _isUserValid;
  bool? _optinforWhatsapp;
  String? _myStoreUrl;
  String? _finID;
  bool? _isPersonalDetailsAdded;
  bool? _isPanKYCCompleted;
  bool? _isAadhaarKYCCompleted;
Data copyWith({  num? id,
  String? userID,
  String? mobileNumber,
  bool? isMobileNumberVerified,
  String? name,
  String? emailID,
  bool? isEmailIDVerified,
  String? registrationTime,
  String? gender,
  String? otp,
  String? otpExpirationTime,
  String? iconURL,
  String? emailOTP,
  String? emailOTPExpirationTime,
  String? token,
  String? tokenExpirationTime,
  num? languageID,
  String? language,
  String? occupation,
  String? qualification,
  String? income,
  String? dob,
  num? pincode,
  String? city,
  String? district,
  String? state,
  String? referralCode,
  String? mpin,
  bool? isUserValid,
  bool? optinforWhatsapp,
  String? myStoreUrl,
  String? finID,
  bool? isPersonalDetailsAdded,
  bool? isPanKYCCompleted,
  bool? isAadhaarKYCCompleted,
}) => Data(  id: id ?? _id,
  userID: userID ?? _userID,
  mobileNumber: mobileNumber ?? _mobileNumber,
  isMobileNumberVerified: isMobileNumberVerified ?? _isMobileNumberVerified,
  name: name ?? _name,
  emailID: emailID ?? _emailID,
  isEmailIDVerified: isEmailIDVerified ?? _isEmailIDVerified,
  registrationTime: registrationTime ?? _registrationTime,
  gender: gender ?? _gender,
  otp: otp ?? _otp,
  otpExpirationTime: otpExpirationTime ?? _otpExpirationTime,
  iconURL: iconURL ?? _iconURL,
  emailOTP: emailOTP ?? _emailOTP,
  emailOTPExpirationTime: emailOTPExpirationTime ?? _emailOTPExpirationTime,
  token: token ?? _token,
  tokenExpirationTime: tokenExpirationTime ?? _tokenExpirationTime,
  languageID: languageID ?? _languageID,
  language: language ?? _language,
  occupation: occupation ?? _occupation,
  qualification: qualification ?? _qualification,
  income: income ?? _income,
  dob: dob ?? _dob,
  pincode: pincode ?? _pincode,
  city: city ?? _city,
  district: district ?? _district,
  state: state ?? _state,
  referralCode: referralCode ?? _referralCode,
  mpin: mpin ?? _mpin,
  isUserValid: isUserValid ?? _isUserValid,
  optinforWhatsapp: optinforWhatsapp ?? _optinforWhatsapp,
  myStoreUrl: myStoreUrl ?? _myStoreUrl,
  finID: finID ?? _finID,
  isPersonalDetailsAdded: isPersonalDetailsAdded ?? _isPersonalDetailsAdded,
  isPanKYCCompleted: isPanKYCCompleted ?? _isPanKYCCompleted,
  isAadhaarKYCCompleted: isAadhaarKYCCompleted ?? _isAadhaarKYCCompleted,
);
  num? get id => _id;
  String? get userID => _userID;
  String? get mobileNumber => _mobileNumber;
  bool? get isMobileNumberVerified => _isMobileNumberVerified;
  String? get name => _name;
  String? get emailID => _emailID;
  bool? get isEmailIDVerified => _isEmailIDVerified;
  String? get registrationTime => _registrationTime;
  String? get gender => _gender;
  String? get otp => _otp;
  String? get otpExpirationTime => _otpExpirationTime;
  String? get iconURL => _iconURL;
  String? get emailOTP => _emailOTP;
  String? get emailOTPExpirationTime => _emailOTPExpirationTime;
  String? get token => _token;
  String? get tokenExpirationTime => _tokenExpirationTime;
  num? get languageID => _languageID;
  String? get language => _language;
  String? get occupation => _occupation;
  String? get qualification => _qualification;
  String? get income => _income;
  String? get dob => _dob;
  num? get pincode => _pincode;
  String? get city => _city;
  String? get district => _district;
  String? get state => _state;
  String? get referralCode => _referralCode;
  String? get mpin => _mpin;
  bool? get isUserValid => _isUserValid;
  bool? get optinforWhatsapp => _optinforWhatsapp;
  String? get myStoreUrl => _myStoreUrl;
  String? get finID => _finID;
  bool? get isPersonalDetailsAdded => _isPersonalDetailsAdded;
  bool? get isPanKYCCompleted => _isPanKYCCompleted;
  bool? get isAadhaarKYCCompleted => _isAadhaarKYCCompleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userID'] = _userID;
    map['mobileNumber'] = _mobileNumber;
    map['isMobileNumberVerified'] = _isMobileNumberVerified;
    map['name'] = _name;
    map['emailID'] = _emailID;
    map['isEmailIDVerified'] = _isEmailIDVerified;
    map['registrationTime'] = _registrationTime;
    map['gender'] = _gender;
    map['otp'] = _otp;
    map['otpExpirationTime'] = _otpExpirationTime;
    map['iconURL'] = _iconURL;
    map['emailOTP'] = _emailOTP;
    map['emailOTPExpirationTime'] = _emailOTPExpirationTime;
    map['token'] = _token;
    map['tokenExpirationTime'] = _tokenExpirationTime;
    map['languageID'] = _languageID;
    map['language'] = _language;
    map['occupation'] = _occupation;
    map['qualification'] = _qualification;
    map['income'] = _income;
    map['dob'] = _dob;
    map['pincode'] = _pincode;
    map['city'] = _city;
    map['district'] = _district;
    map['state'] = _state;
    map['referralCode'] = _referralCode;
    map['mpin'] = _mpin;
    map['isUserValid'] = _isUserValid;
    map['optinforWhatsapp'] = _optinforWhatsapp;
    map['myStoreUrl'] = _myStoreUrl;
    map['finID'] = _finID;
    map['isPersonalDetailsAdded'] = _isPersonalDetailsAdded;
    map['isPanKYCCompleted'] = _isPanKYCCompleted;
    map['isAadhaarKYCCompleted'] = _isAadhaarKYCCompleted;
    return map;
  }

}