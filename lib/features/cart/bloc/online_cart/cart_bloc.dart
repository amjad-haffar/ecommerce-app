import 'package:bloc/bloc.dart';
import 'package:ecommerce/API/repository.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Repository cartRepo;
  CartBloc(this.cartRepo) : super(CartInitial()) {
    on<CartInitalEvent>(cartInitalEvent);
  }
  FutureOr<void> cartInitalEvent(
      CartInitalEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    try {
      var data = await cartRepo.getCart();
            data.fold((l) => emit(CartErrorState(error: l.props.first.toString())),
      ((r) =>emit(CartLoadedState(cart: r)) ));
    } catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  }
}
