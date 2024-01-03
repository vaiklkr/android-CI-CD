import 'package:finjoy_app/api/visiting%20card/model/visiting_card_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../repository/repository.dart';

class GetVisitingCardBloc {
  final _getVisitingCardList = PublishSubject<VisitingCardModel>();
  final _repository = Repository();

  Stream<VisitingCardModel> get getVisitingCardStream =>
      _getVisitingCardList.stream;

  Future getVisitingCardSink() async {
    final VisitingCardModel model = await _repository.onVisitingCard();
    _getVisitingCardList.sink.add(model);
  }

  void dispose() {
    _getVisitingCardList.close();
  }
}

final getVisitingCardBloc = GetVisitingCardBloc();
