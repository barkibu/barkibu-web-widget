import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/faq/faq_event.dart';
import 'package:common_barkibu_dart/bloc/faq/faq_state.dart';
import 'package:common_barkibu_dart/domain/faq/get_faq_use_case.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final GetFaqUseCase _getFaqUseCase;
  final AnalyticsService _analyticsService;

  FaqBloc(this._getFaqUseCase, this._analyticsService);

  @override
  FaqState get initialState => FaqState();

  @override
  Stream<FaqState> mapEventToState(FaqEvent event) async* {
    if (event is FaqViewRequested) {
      yield await _fetchFaqs(event.filter);
    }

    if (event is FaqContentExpanded) {
      _analyticsService.event.faq.logFaqExpanded(event.planName, event.faqId);
    }
  }

  Future<FaqState> _fetchFaqs([String filter]) async {
    return FaqLoadSuccess(await _getFaqUseCase.getFaq(filter));
  }
}
