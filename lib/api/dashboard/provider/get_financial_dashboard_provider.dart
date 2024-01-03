import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/const/config.dart';
import 'package:finjoy_app/api/dashboard/model/get_financial_dashboard_model.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class GetFinancialDashboardApi {
  Future<GetDashboardMenuModel?> onGetFinancialDashboardApi() async {
    try {
      final uri = Uri.parse(Config.dashboardURL + Config.getfinancialDashboard);
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
        return GetDashboardMenuModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
