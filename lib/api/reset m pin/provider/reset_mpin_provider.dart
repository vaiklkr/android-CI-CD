import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

import '../model/reset_mpin_model.dart';

class GetResetMPINApi {
  Future<dynamic> onResetMPINApi(
    String mpin,
    String confirmpin,
  ) async {
    try {
      final uri = Uri.parse(Config.myprofileURL + Config.resetMPIN);
      String? token = PrefObj.preferences?.get(PrefKeys.DEVICETOKEN);

      dynamic postData = {
        'MPIN': mpin,
        'ConfirmMPIN': confirmpin,
      };
      if (token == null) {
        return null;
      }
      final response = await http.post(uri,
          body: json.encode(postData),
          headers: {
            'content-Type': 'application/json',
            'Authorization': token
          });

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        return MyProfileResetMpinmodel.fromJson(responseJson);
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
