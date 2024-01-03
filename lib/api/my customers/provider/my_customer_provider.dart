import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;
import '../model/my_customer_list_model.dart';

class GetMyCustomerListApi {
  Future<MyCustomerListModel?> onGetMyCustomerListApi(
     ) async {
    try {
      final uri =
      Uri.parse(Config.dashboardURL + Config.getMyCustomerDetails);
      // Check if the token is not null before using it
      String? token = PrefObj.preferences?.get(PrefKeys.DEVICETOKEN);
      // String? token =
      //     'BzxF0wusjtKaLYn0Fo9Ag2LXA8xOvn7YHP/7gXW61sXNTm1Kfek9P00UV17WfaWd+hxEmO4wpr+FRr69OeVkOMswDseeHqzwCjZGc4/E60Y=';
      // print('demoLog token : ${token}');
      if (token == null) {
        // Handle the case where the token is null
        return null;
      }


      final response = await http.get(
        uri,
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
        print("Success");
        dynamic responseJson = json.decode(response.body);

        return MyCustomerListModel.fromJson(responseJson);
      } else {
        print('Failed');
        // Handle other status codes if needed
        return null; // Return null or handle error case appropriately
      }
    } catch (exception) {
      return null; // Return null or handle error case appropriately
    }
  }
}
