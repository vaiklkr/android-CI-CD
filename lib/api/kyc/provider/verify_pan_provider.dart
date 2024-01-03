import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/kyc/model/verify_pan_model.dart';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class VerifyPanApi {
  Future<dynamic> onVerifyPanApi(
    String panNumber,
  ) async {
    try {
      final uri = Uri.parse(Config.kycURL + Config.verifyPAN);
      dynamic postData = {
        'PANNumber': panNumber,
      };

      String? token = PrefObj.preferences?.get(PrefKeys.DEVICETOKEN);
      if (token == null) {
        return null;
      }
      final response = await http.post(
        uri,
        body: json.encode(postData),
        headers: {
          'content-Type': 'application/json',
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);
        return VerifyPanModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
