import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;
import '../model/personal_details_model.dart';

class PersonalDetailsApi {
  Future<PersonalDetailsModel?> onPersonalDetailsApi(
      String occupation,
      String qualification,
      String income,
      String city,
      String state,
      String district,
      bool optinforWhatsapp,
      String pincode,
      String dob) async {
    try {
      final uri = Uri.parse(Config.userURL + Config.personaldetails);
      dynamic postData = {
        'occupation': occupation,
        'qualification': qualification,
        'income': income,
        'city': city,
        'district': district,
        'state': state,
        'OptinforWhatsapp': optinforWhatsapp,
        'pincode': pincode,
        'dob': dob
      };

      String? token = PrefObj.preferences?.get(PrefKeys.DEVICETOKEN);
      if (token == null) {
        return null;
      }
      final response = await http.post(
        uri,
        body: json.encode(postData),
        headers: {'content-Type': 'application/json', 'Authorization': token},
      );

      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);
        return PersonalDetailsModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
