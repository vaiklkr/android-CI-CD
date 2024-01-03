import 'package:finjoy_app/api/dashboard/model/get_dashboard_banner_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GetDashboardBannerBloc {
  final _getDashboardBannerList = PublishSubject<GetDashboardBannerModel>();
  final _repository = Repository();

  Stream<GetDashboardBannerModel> get getDashboardBannerStream =>
      _getDashboardBannerList.stream;

  Future getDashboarBannerSink() async {
    final GetDashboardBannerModel model =
        await _repository.onGetDashboardBanner();
    _getDashboardBannerList.sink.add(model);
  }

  void dispose() {
    _getDashboardBannerList.close();
  }
}

final getDashboardBannerBloc = GetDashboardBannerBloc();
