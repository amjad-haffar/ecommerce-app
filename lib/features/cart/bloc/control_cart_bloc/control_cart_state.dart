part of 'control_cart_bloc.dart';
sealed class ControlBlocState extends Equatable{}


class ControlCartInitial extends ControlBlocState{
  ControlCartInitial({required this.cart, required this.total});
  final List<CartM> cart;
  final double total;
  
  @override
  List<Object?> get props => [cart,total];
}

class ControlCartError extends ControlBlocState{
  @override
  List<Object?> get props => [];
}
