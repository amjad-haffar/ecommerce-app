part of 'control_cart_bloc.dart';

sealed class ControlCartEvent extends Equatable {}

class ControlCart extends ControlCartEvent {
  @override
  List<Object?> get props => [];
}

class AddProduct extends ControlCartEvent {
  final CartM product;
  AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

class DeleteProduct extends ControlCartEvent {
  final CartM product;
  DeleteProduct(this.product);
  @override
  List<Object> get props => [product];
}

class LowerQuantity extends ControlCartEvent {
  final CartM product;
  LowerQuantity(this.product);
  @override
  List<Object> get props => [product];
}
