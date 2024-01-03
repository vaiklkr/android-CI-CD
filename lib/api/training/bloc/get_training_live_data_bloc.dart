import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/api/training/model/training_course_list_model.dart';
import 'package:rxdart/subjects.dart';

import '../model/training_live_list_model.dart';

class GetTrainingLiveDataBloc {
  final _getTrainingLiveList = PublishSubject<TrainingLiveListModel>();
  final _repository = Repository();

  Stream<TrainingLiveListModel> get getTrainingLiveListStream => _getTrainingLiveList.stream;

  Future getTrainingLiveDataSink() async {
    final TrainingLiveListModel model = await _repository.onGetTrainingLiveData();
    _getTrainingLiveList.sink.add(model);
  }

  void dispose() {
    _getTrainingLiveList.close();
  }
}

final getTrainingLiveDataBloc = GetTrainingLiveDataBloc();
