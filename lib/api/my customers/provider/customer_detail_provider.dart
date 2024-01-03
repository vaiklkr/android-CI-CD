import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/api/my%20customers/model/customer_detail_model.dart';
import 'package:finjoy_app/api/notification/model/notifications_list.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/custom_button.dart';

class CustomerDetailApi {
  Future<CustomerDetailModel?> onCustomerDetailApi(String customerId) async {
    final Uri url = Uri.parse(Config.customerDetailUrl);

    final Map<String, String> params = {
      'customerId': customerId,
    };

    final Uri finalUrl = url.replace(queryParameters: params);

    final response =
    await http.get(finalUrl, headers: {
      'content-Type': 'application/json',
      'Authorization': PrefObj.preferences?.get(PrefKeys.DEVICETOKEN),
    });

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);

        return CustomerDetailModel.fromJson(responseJson);
      } else {
        // Handle other status codes if needed
        return null; // Return null or handle error case appropriately
      }
    } else {
      return null;
    }
  }
}
