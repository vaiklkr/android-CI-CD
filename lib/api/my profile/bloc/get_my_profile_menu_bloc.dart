import 'package:finjoy_app/api/repository/repository.dart';
import 'package:rxdart/subjects.dart';

import '../model/get_my_profile_menu_model.dart';

class GetMyProfileMenuBloc {
  final _getMyProfileMenuList = PublishSubject<GetMyProfileMenuModel>();
  final _repository = Repository();

  Stream<GetMyProfileMenuModel> get getMyProfileMenuStream =>
      _getMyProfileMenuList.stream;

  Future getMyProfileMenuSink() async {
    final GetMyProfileMenuModel model = await _repository.onMyProfileMenu();
    _getMyProfileMenuList.sink.add(model);
  }

  void dispose() {
    _getMyProfileMenuList.close();
  }
}

final getMyProfileMenuBloc = GetMyProfileMenuBloc();
