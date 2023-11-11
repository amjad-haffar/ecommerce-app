part of 'home_bloc.dart';

sealed class HomeState  extends Equatable{}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  HomeLoadedState({required this.products});
  final Product products;
  @override
  List<Object?> get props => [products];
}

class HomeErrorState extends HomeState {
  HomeErrorState({required this.error});
  final String error;
  @override
  List<Object?> get props => [error];
}
