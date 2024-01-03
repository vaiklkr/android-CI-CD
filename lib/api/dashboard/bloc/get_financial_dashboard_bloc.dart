import 'package:finjoy_app/api/dashboard/model/get_financial_dashboard_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GetFinancialDashboardBloc {
  final _getFinancialDashboardList = PublishSubject<GetDashboardMenuModel>();
  final _repository = Repository();

  Stream<GetDashboardMenuModel> get getFinancialDashboardStream =>
      _getFinancialDashboardList.stream;

  Future getFinancialDashboardSink() async {
    final GetDashboardMenuModel model =
        await _repository.onGetFinancialDashboard();
    _getFinancialDashboardList.sink.add(model);
  }

  void dispose() {
    _getFinancialDashboardList.close();
  }
}

final getFinancialDashboardBloc = GetFinancialDashboardBloc();
