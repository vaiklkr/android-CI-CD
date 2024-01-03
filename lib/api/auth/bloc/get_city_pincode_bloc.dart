import 'package:finjoy_app/api/auth/model/get_city_pincode_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GetCityPincodeBloc {
  final _getCityPincodeList = PublishSubject<GetCityPincodeModel>();
  final _repository = Repository();

  Stream<GetCityPincodeModel> get getCityPincodeStream =>
      _getCityPincodeList.stream;

  Future getCityPincodeSink(String pinCode) async {
    final GetCityPincodeModel model =
        await _repository.onGetCityPincode(pinCode);
    _getCityPincodeList.sink.add(model);
  }

  void dispose() {
    _getCityPincodeList.close();
  }
}

final getCityPincodeBloc = GetCityPincodeBloc();
