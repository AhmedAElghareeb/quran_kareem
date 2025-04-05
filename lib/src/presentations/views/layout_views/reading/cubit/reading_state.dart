part of 'reading_cubit.dart';

@immutable
sealed class ReadingState {}

final class ReadingInitial extends ReadingState {}

final class ReadingLoadingState extends ReadingState {}

final class ReadingLoadedState extends ReadingState {}

final class ReadingErrorState extends ReadingState {
  final ErrorModel errorModel;

  ReadingErrorState({required this.errorModel});
}
