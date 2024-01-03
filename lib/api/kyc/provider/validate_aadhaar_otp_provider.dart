import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/api/kyc/model/validate_aadhaar_otp_model.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class VerifyAadharOTPApi {
  Future<dynamic> onVerifyAadharOTPApi(
    String adharIdnum,
    String sessionId,
    String referenceID,
    String otp,
  ) async {
    try {
      final uri = Uri.parse(Config.kycURL + Config.verifyAadharOTP);

      String aadhar = adharIdnum.replaceAll(' ', '');
      dynamic postData = {
        'id_number': aadhar,
        'sessionid': sessionId,
        'reference_id': referenceID,
        'otp': otp,
      };

      final response =
          await http.post(uri, body: json.encode(postData), headers: {
        'content-Type': 'application/json',
        'Authorization': PrefObj.preferences?.get(PrefKeys.DEVICETOKEN),
      });

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        return VerifyAadharOTPModel.fromJson(responseJson);
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
