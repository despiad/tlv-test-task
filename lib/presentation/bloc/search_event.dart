part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class PerformSearch extends SearchEvent {
  final String query;

  PerformSearch(this.query);
}

class ClearSearch extends SearchEvent {}