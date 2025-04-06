part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {}

final class HomeErrorState extends HomeState {
  final ErrorModel errorModel;

  HomeErrorState({required this.errorModel});
}
