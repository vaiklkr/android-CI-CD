import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/bank%20kyc/model/verify_bank_account_model.dart';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class VerifyBankAccountApi {
  Future<dynamic> onVerifyBankAcccountApi(String accountnum) async {
    try {
      final uri =
          Uri.parse(Config.kycURL + Config.verifyBankAccount + accountnum);

      final response = await http.get(uri, headers: {
        'content-Type': 'application/json',
        'Authorization': PrefObj.preferences?.get(PrefKeys.DEVICETOKEN),
      });

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        return VerifyBankAccountModel.fromJson(responseJson);
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
