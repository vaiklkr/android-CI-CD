import 'package:finjoy_app/api/marketing/model/get_marketing_data_model.dart';
import 'package:finjoy_app/api/my%20customers/model/customer_detail_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GetCustomerDetailBloc {
  final _getCustomerDetailList = PublishSubject<CustomerDetailModel>();
  final _repository = Repository();

  Stream<CustomerDetailModel> get getCustomerDetailStream =>
      _getCustomerDetailList.stream;

  Future getCustomerDetailSink(String customerId) async {
    final CustomerDetailModel model = await _repository.onCustomerDetailApi(customerId);
    _getCustomerDetailList.sink.add(model);
  }

  void dispose() {
    _getCustomerDetailList.close();
  }
}

final getCustomerDetailBloc = GetCustomerDetailBloc();
