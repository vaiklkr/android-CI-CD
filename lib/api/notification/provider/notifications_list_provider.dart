import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/api/notification/model/notifications_list.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/custom_button.dart';

class GetNotificationsListApi {
  Future<NotificationsList?> onNotificationsListApi() async {
    final Uri url = Uri.parse(Config.notificationListUrl);
    final Map<String, String> headers = {
      'Authorization': 'Bearer YzQ2NDE3NzEtZmM4Yi00MGZiLThkMDAtY2RmNTQ3YTBlOGUy', // Replace with your authorization logic
    };
    final Map<String, String> params = {
      'app_id': '6a04269c-93f1-4d19-a619-4fcccc495117',
    };

    final Uri finalUrl = url.replace(queryParameters: params);

    final response = await http.get(finalUrl, headers: headers);

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);

        return NotificationsList.fromJson(responseJson);
      } else {
        // Handle other status codes if needed
        return null; // Return null or handle error case appropriately
      }
    } else {
      return null;
    }
  }
}
