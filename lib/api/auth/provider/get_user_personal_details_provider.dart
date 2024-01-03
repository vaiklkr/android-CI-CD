import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/auth/model/get_user_personal_details_model.dart';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class GetUserPersonalDetailsApi {
  Future<GetUserPersonalDetailsModel?> onGetUserPersonalDetailsApi() async {
    try {
      final uri = Uri.parse(Config.userURL + Config.getUserPersonalDetails);
      String? token = PrefObj.preferences?.get(PrefKeys.DEVICETOKEN);
      // String? token =
      //     'lmoU+10JBfDG9dyDp22f346M0l2pKJp803hv1gcBQH0pVoKil7I0hIGP004sWp+/Xq3hcOVXwJ6RaRj66SPqj4a1keG/wn/7XrVZbXOdTZM=';
      if (token == null) {
        return null;
      }
      final response = await http.get(
        uri,
        headers: {'content-Type': 'application/json', 'Authorization': token},
      );
      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);
        return GetUserPersonalDetailsModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
