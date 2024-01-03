import 'package:finjoy_app/api/auth/model/get_user_personal_details_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GetUserPersonalDetailsBloc {
  final _getUserPersonalDetailsList =
      PublishSubject<GetUserPersonalDetailsModel>();
  final _repository = Repository();

  Stream<GetUserPersonalDetailsModel> get getUserPersonalDetailsStream =>
      _getUserPersonalDetailsList.stream;

  Future getUserPersonalDetailsSink() async {
    final GetUserPersonalDetailsModel model =
        await _repository.onGetUserPersonalDetails();
    _getUserPersonalDetailsList.sink.add(model);
  }

  void dispose() {
    _getUserPersonalDetailsList.close();
  }
}

final getUserPersonalDetailsBloc = GetUserPersonalDetailsBloc();
