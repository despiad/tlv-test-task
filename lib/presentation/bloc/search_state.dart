part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Mission> missions;

  SearchSuccess(this.missions);
}

class SearchSuccessEmpty extends SearchState {}

class SearchError extends SearchState {
  final String errorMessage;

  SearchError({required this.errorMessage});
}