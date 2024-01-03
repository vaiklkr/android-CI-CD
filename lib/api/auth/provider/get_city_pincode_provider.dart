import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/auth/model/get_city_pincode_model.dart';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class GetCityPincodeApi {
  Future<GetCityPincodeModel?> onGetCityPincodeAPI(String pinCode) async {
    try {
      final response = await http.get(
        Uri.parse(Config.userURL + Config.cityPincode + pinCode),
        headers: {
          'Authorization': PrefObj.preferences?.get(PrefKeys.DEVICETOKEN),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 400) {
        dynamic responseJson = json.decode(response.body);
        return GetCityPincodeModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
