import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

import '../model/get_my_profile_menu_model.dart';

class GetMyProfileMenuApi {
  Future<GetMyProfileMenuModel?> onGetMyProfileMenuApi() async {
    try {
      final uri = Uri.parse(Config.myprofileURL + Config.getMyProfileMenu);
      String? token = PrefObj.preferences?.get(PrefKeys.DEVICETOKEN);
      if (token == null) {
        return null;
      }
      final response = await http.get(
        uri,
        headers: {'content-Type': 'application/json', 'Authorization': token},
      );
      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);
        return GetMyProfileMenuModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
