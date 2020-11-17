part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ItemModel> items;

  HomeLoaded({@required this.items});
}

class HomeError extends HomeState {
  final String messages;

  HomeError({@required this.messages});
}
