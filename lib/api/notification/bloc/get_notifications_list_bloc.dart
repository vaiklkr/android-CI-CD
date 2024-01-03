import 'package:finjoy_app/api/repository/repository.dart';
import 'package:rxdart/subjects.dart';

import '../model/notifications_list.dart';


class GetNotificationsListBloc {
  final _getNotificationsList = PublishSubject<NotificationsList>();
  final _repository = Repository();

  Stream<NotificationsList> get getNotificationsListStream =>
      _getNotificationsList.stream;

  Future getNotificationsListSink() async {
    final NotificationsList model = await _repository.onGetNotificationsListApi();
    _getNotificationsList.sink.add(model);
  }

  void dispose() {
    _getNotificationsList.close();
  }
}

final getNotificationsListBloc = GetNotificationsListBloc();
