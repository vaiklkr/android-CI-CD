import 'package:finjoy_app/api/marketing/model/get_marketing_data_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GetMarketingDataBloc {
  final _getMarketingDataList = PublishSubject<GetMarketingDataModel>();
  final _repository = Repository();

  Stream<GetMarketingDataModel> get getMarketingDataStream =>
      _getMarketingDataList.stream;

  Future getMarketingDataSink() async {
    final GetMarketingDataModel model = await _repository.onGetMarketingData();
    _getMarketingDataList.sink.add(model);
  }

  void dispose() {
    _getMarketingDataList.close();
  }
}

final getMarketingDataBloc = GetMarketingDataBloc();
