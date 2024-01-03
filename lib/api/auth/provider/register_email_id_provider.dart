import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/auth/model/register_email_id_model.dart';
import 'package:finjoy_app/api/const/config.dart';
import 'package:http/http.dart' as http;

class RegisterEmailIdApi {
  Future<dynamic> onRegisteremailIdApi(
    String mobilenumber,
    String emailiD,
  ) async {
    try {
      final uri = Uri.parse(Config.userURL + Config.registeremailiD);
      dynamic postData = {
        'MobileNumber': mobilenumber,
        'Language': "English",
        "EmailID": emailiD
      };
      final response =
          await http.post(uri, body: json.encode(postData), headers: {
        'content-Type': 'application/json',
      });

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        return RegisterEmailIDModel.fromJson(responseJson);
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
