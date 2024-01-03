import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get english;
  String get hindi;
  String get marathi;
  String get tamil;
  String get continute;
  String get signup;
  String get hello;
  String get phonenum;
  String get enphonenum;
  String get email;
  String get enemail;
  String get name;
  String get enname;
  String get verifyph;
  String get verifyed;
  String get verifyemail;
  String get pleaseselect;
  String get man;
  String get woman;
  String get trans;
  String get havean;
  String get enternow;
  String get hi;
  String get pratap;
  String get financial;
  String get ecommerce;
  String get wallet;
  String get sellearn;
  String get seeall;
  String get creditcard;
  String get accountinfo;
  String get financing;
  String get creditline;
}
