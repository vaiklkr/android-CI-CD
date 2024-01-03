import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

import '../model/add_customer_model.dart';

class AddCustomerApi {
  Future<dynamic> onAddCustomerApi(String customermobilenumber, String pannumber, String nameasperpan, String customermailid,
      String pincode, String state, String district, String city, String offerid, String panverificationid) async {
    try {
      final uri = Uri.parse(Config.dashboardURL + Config.addCustomer);
      String? token = PrefObj.preferences?.get(PrefKeys.DEVICETOKEN);
      if (token == null) {
        return null;
      }
      dynamic postData = {
        'customermobilenumber': customermobilenumber,
        'pannumber': pannumber,
        'nameasperpan': nameasperpan,
        'customermailid': customermailid,
        "pincode": pincode,
        "state": state,
        "district": district,
        "city": city,
        "offerid": offerid,
        "panverificationid": panverificationid,
      };
      
      // print('customermobilenumber =====> $customermobilenumber  ====>  pannumber =====>   $pannumber  ====>  nameasperpan =====>   $nameasperpan  ====>  pincode =====>   $pincode  ====>  state =====>   $state  ====>  district =====>   $district  ====>  city =====>   $city  ====>  offerid =====>   $offerid  ====>  panverificationid =====>   $panverificationid');
      
      final response =
          await http.post(uri, body: json.encode(postData), headers: {
        'content-Type': 'application/json',
        'Authorization': token,
      });

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        return AddCustomerModel.fromJson(responseJson);
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
