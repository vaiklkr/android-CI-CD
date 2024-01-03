import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/api/training/model/training_course_list_model.dart';
import 'package:rxdart/subjects.dart';

class GetTrainingCourseDataBloc {
  final _getTrainingCourseList = PublishSubject<TrainingCourseListModel>();
  final _repository = Repository();

  Stream<TrainingCourseListModel> get getTrainingCourseListStream => _getTrainingCourseList.stream;

  Future getTrainingCourseDataSink() async {
    final TrainingCourseListModel model = await _repository.onGetTrainingCourseData();
    _getTrainingCourseList.sink.add(model);
  }

  void dispose() {
    _getTrainingCourseList.close();
  }
}

final getTrainingCourseDataBloc = GetTrainingCourseDataBloc();
