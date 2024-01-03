import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/auth/model/sign_up_model.dart';
import 'package:finjoy_app/api/const/config.dart';
import 'package:http/http.dart' as http;

class SignUpApi {
  Future<dynamic> onSignUpApi(
    String mobilenumber,
    String emailID,
    String fullname,
    String gender,
      String referral,
  ) async {
    try {
      final uri = Uri.parse(Config.userURL + Config.signUp);
      dynamic postData = {
        'MobileNumber': mobilenumber,
        'Language': "English",
        'EmailID': emailID,
        "Name": fullname,
        "Gender": gender,
        // "Gender": 'Male',
        // "ReferralCode": 'NA',
        "ReferralCode": referral,

      };
      final response =
          await http.post(uri, body: json.encode(postData), headers: {
        'content-Type': 'application/json',
      });

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        return SignUpModel.fromJson(responseJson);
      } else if (response.statusCode == 401 ||
          response.statusCode == 403 ||
          response.statusCode == 404 ||
          response.statusCode == 500 ||
          response.statusCode == 409) {
        responseJson = json.decode(response.body);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
