import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;
import '../model/get_financial_offerlist_model.dart';

class GetFinancialOfferListApi {
  Future<GetFinancialOfferlistModel?> onGetFinancialOfferListApi(
      String offercategoryid, String pinCode) async {
    try {
      final uri =
          Uri.parse(Config.dashboardURL + Config.getFinancialOfferListUrl);
      // Check if the token is not null before using it
      String? token = PrefObj.preferences?.get(PrefKeys.DEVICETOKEN);
      // String? token =
      //     'BzxF0wusjtKaLYn0Fo9Ag2LXA8xOvn7YHP/7gXW61sXNTm1Kfek9P00UV17WfaWd+hxEmO4wpr+FRr69OeVkOMswDseeHqzwCjZGc4/E60Y=';
      // print('demoLog token : ${token}');
      if (token == null) {
        // Handle the case where the token is null
        return null;
      }

      dynamic postData = {
        'offercategoryid': offercategoryid,
        'Pincode': pinCode,
      };

      final response = await http.post(
        uri,
        body: json.encode(postData),
        headers: {
          'content-Type': 'application/json',
          'Authorization': token,
        },
      );

      // final response = await http.post(uri, body: json.encode(postData), headers: {
      //   'content-Type': 'application/json',
      //   // 'Authorization': "t63OYp2hU7H1Bq++6xLHhwsQTFxWDFUjdPBD1pZ5TC9zj5xPuBlxWqlXsq5fyaSPphRydlgDEvYlOihg0nuIpdYiQl0mdW5op5JeHGAcJQM="
      //
      //   'Authorization': PrefObj.preferences?.get(PrefKeys.DEVICETOKEN)
      // });

      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);

        return GetFinancialOfferlistModel.fromJson(responseJson);
      } else {
        // Handle other status codes if needed
        return null; // Return null or handle error case appropriately
      }
    } catch (exception) {
      return null; // Return null or handle error case appropriately
    }
  }
}
