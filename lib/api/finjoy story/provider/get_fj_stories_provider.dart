import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/api/finjoy%20story/model/get_fj_stories_model.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class GetFJStoriesApi {
  Future<GetFJStoriesModel?> onGetFJStoriesAPI() async {
    try {
      final response = await http.get(
        Uri.parse(Config.dashboardURL + Config.getFJStories),
        headers: {
          'Authorization': PrefObj.preferences?.get(PrefKeys.DEVICETOKEN),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 400) {
        dynamic responseJson = json.decode(response.body);
        return GetFJStoriesModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
