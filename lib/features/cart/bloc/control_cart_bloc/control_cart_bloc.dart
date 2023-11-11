import 'package:bloc/bloc.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:equatable/equatable.dart';

part 'control_cart_event.dart';
part 'control_cart_state.dart';

class ControlCartBloc extends Bloc<ControlCartEvent, ControlCartInitial> {
  ControlCartBloc() : super(ControlCartInitial(cart: [], total: 0)) {
    on<AddProduct>(addEvent);
    on<DeleteProduct>(deleteEvent);
    on<LowerQuantity>(lowerQuantityByOne);
  }
  Future<void> addEvent(
      ControlCartEvent event, Emitter<ControlBlocState> emit) async {
    if (event is AddProduct) {
      final updateCart = List<CartM>.from(state.cart);
      double total = 0;
      int search =
          updateCart.indexWhere((element) => element.id == event.product.id);
      for (var element in updateCart) {
        total += (element.price) * element.quantity;
      }
      total += event.product.price;
      if (search == -1) {
        updateCart.add(event.product);
      } else {
        updateCart[search].quantity += 1;
      }
      
      emit(ControlCartInitial(cart: updateCart, total: total));
    }
  }

  Future<void> deleteEvent(
      ControlCartEvent event, Emitter<ControlCartInitial> emit) async {
    if (event is DeleteProduct) {
      double total = 0;
      var updateCart = List<CartM>.from(state.cart);
      for (var element in updateCart) {
        total += (element.price) * element.quantity;
      }
      updateCart.removeWhere(
        (element) => element.id == event.product.id,
      );
      total -= (event.product.price * event.product.quantity);
      emit(ControlCartInitial(cart: updateCart, total: total));
    }
  }

  Future<void> lowerQuantityByOne(
      ControlCartEvent event, Emitter<ControlCartInitial> emit) async {
    if (event is LowerQuantity) {
      double total = 0;
      var updateCart = List<CartM>.from(state.cart);
      for (var element in updateCart) {
        total += (element.price) * element.quantity;
      }
      int search = updateCart.indexWhere(
        (element) => element.id == event.product.id,
      );
      updateCart[search].quantity -= 1;
      total -= event.product.price;

      emit(ControlCartInitial(cart: updateCart, total: total));
    }
  }
}
