import 'package:finjoy_app/api/dashboard/model/get_sell_and_earn_data_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GetSellAndEarnDataBloc {
  final _getSellandEarnDataList = PublishSubject<GetSellAndEarnDataModel>();
  final _repository = Repository();

  Stream<GetSellAndEarnDataModel> get getSellAndEarnDataStream =>
      _getSellandEarnDataList.stream;

  Future getSellAndEarnDataSink() async {
    final GetSellAndEarnDataModel model = await _repository.onSellAndEarnData();
    _getSellandEarnDataList.sink.add(model);
  }

  void dispose() {
    _getSellandEarnDataList.close();
  }
}

final getSellAndEarnDataBloc = GetSellAndEarnDataBloc();
