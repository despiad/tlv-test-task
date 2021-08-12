import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tlv_test_task/domain/model/mission.dart';
import 'package:tlv_test_task/infrastructure/repositories/mission_repository.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MissionRepository _missionRepository;

  SearchBloc(this._missionRepository) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is PerformSearch) {
      yield* mapPerformSearchToState(event);
    } else if (event is ClearSearch) {
      yield* mapClearSearchToState();
    }
  }

  Stream<SearchState> mapPerformSearchToState(PerformSearch event) async* {
    yield SearchLoading();
    try {
      final results =
          await _missionRepository.getMissionsByName(name: event.query);
      if (results.isEmpty) {
        yield SearchSuccessEmpty();
      } else {
        yield SearchSuccess(results);
      }
    } on Exception catch (e) {
      yield SearchError(errorMessage: e.toString());
    }
  }

  Stream<SearchState> mapClearSearchToState() async* {
    yield SearchInitial();
  }

  @override
  Stream<Transition<SearchEvent, SearchState>> transformTransitions(
      Stream<Transition<SearchEvent, SearchState>> transitions) {
    return transitions.debounceTime(const Duration(milliseconds: 500));
  }
}
