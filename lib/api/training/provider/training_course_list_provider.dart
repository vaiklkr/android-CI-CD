import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

import '../model/training_course_list_model.dart';

class GetTrainingCourseDataApi {
  Future<TrainingCourseListModel?> onGetTrainingCourseDataApi() async {
    try {
      final uri =
          Uri.parse(Config.trainingURL + Config.getTrainingData);
      String? token = PrefObj.preferences?.get(PrefKeys.DEVICETOKEN);
      if (token == null) {
        return null;
      }

      final response = await http.get(uri, headers: {
        'content-Type': 'application/json',
        'Authorization': token,
      });

      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);

        return TrainingCourseListModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
