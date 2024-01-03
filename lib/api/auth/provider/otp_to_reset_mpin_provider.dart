import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/auth/model/otp_to_reset_mpin_model.dart';
import 'package:finjoy_app/api/const/config.dart';
import 'package:http/http.dart' as http;

class OTPToResetMPinApi {
  Future<OTPToResetMPINModel?> onOTPToResetMpinApi(String mobNum) async {
    try {
      final uri = Uri.parse(Config.userURL + Config.oTPToResetMPIN + mobNum);
      final response = await http.get(
        uri,
        headers: {
          'content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);
        return OTPToResetMPINModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
