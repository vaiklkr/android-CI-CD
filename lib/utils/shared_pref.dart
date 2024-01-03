// ignore_for_file: constant_identifier_names

import 'package:hive/hive.dart';

class PrefObj {
  static Box? preferences;
}

class PrefKeys {
  static const String DEVICETOKEN = 'Token';

  static const String isKYC = "isKYC";
  static const String isBank = "isBank";
  static const String isLogout = "isLogout";
  static const String FullName = 'fullName';
  static const String ProfileImage = 'profileImage';
  static const String MobileNumber = 'mobileNumber';
  static const String FinID = 'finID';

  static const String OfferId = 'OfferId';
  static const String OfferFullJson = 'offerFullJson';
  static const String OfferTitle = 'offerTitle';
  static const String SellEarnHeaderImage = 'sellEarnHeaderImage';
  static const String CategoryId = 'categoryid';
  static const String SellEarnLayoutType = 'sellEarnLayoutType';
  static const String ClickOfferNotification = 'clickOfferNotification';
}
