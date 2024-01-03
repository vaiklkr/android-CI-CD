import 'package:finjoy_app/api/finjoy%20story/model/get_fj_stories_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GetFJStoriesBloc {
  final _getFjStoriesList = PublishSubject<GetFJStoriesModel>();
  final _repository = Repository();

  Stream<GetFJStoriesModel> get getFJStoriesStream => _getFjStoriesList.stream;

  Future getFJStoriesSink() async {
    final GetFJStoriesModel model = await _repository.onGetFJStories();
    _getFjStoriesList.sink.add(model);
  }

  void dispose() {
    _getFjStoriesList.close();
  }
}

final getFJStoriesBloc = GetFJStoriesBloc();
