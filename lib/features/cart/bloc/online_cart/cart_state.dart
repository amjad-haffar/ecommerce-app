part of 'cart_bloc.dart';

sealed class CartState extends Equatable {}

final class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoadingState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoadedState extends CartState {
  CartLoadedState({required this.cart});
  final Cart cart;
  @override
  List<Object?> get props => [cart];
}

class CartErrorState extends CartState {
  CartErrorState({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}
