import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/bank%20kyc/model/insert_bank_details_model.dart';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class InsertBankDetailssApi {
  Future<dynamic> onInsertBankDetailsApi(
    String accNum,
    String accHolderName,
    String ifscNum,
    String bankName,
  ) async {
    try {
      final uri = Uri.parse(Config.kycURL + Config.insertBankDetails);

      dynamic postData = {
        'AccountNumber': accNum,
        'AccountHolderName': accHolderName,
        'IFSC': ifscNum,
        'BankName': bankName,
      };

      final response =
          await http.post(uri, body: json.encode(postData), headers: {
        'content-Type': 'application/json',
        'Authorization': PrefObj.preferences?.get(PrefKeys.DEVICETOKEN),
      });

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        return InsertBankDetailsModel.fromJson(responseJson);
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
