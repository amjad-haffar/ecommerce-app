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
      int search =
          updateCart.indexWhere((element) => element.id == event.product.id);
      if (search == -1) {
        updateCart.add(event.product);
      } else {
        final currentProduct = updateCart[search];
        updateCart[search] =
            currentProduct.copyWith(quantity: currentProduct.quantity + 1);
      }
      final total = updateCart.fold<double>(
        0,
        (sum, item) => sum + item.price * item.quantity,
      );
      emit(ControlCartInitial(cart: updateCart, total: total));
    }
  }

  Future<void> deleteEvent(
      ControlCartEvent event, Emitter<ControlCartInitial> emit) async {
    if (event is DeleteProduct) {
      var updateCart = List<CartM>.from(state.cart);
      updateCart.removeWhere(
        (element) => element.id == event.product.id,
      );
      final total = updateCart.fold<double>(
        0,
        (sum, item) => sum + item.price * item.quantity,
      );
      emit(ControlCartInitial(cart: updateCart, total: total));
    }
  }

  Future<void> lowerQuantityByOne(
      ControlCartEvent event, Emitter<ControlCartInitial> emit) async {
    if (event is LowerQuantity) {
      var updateCart = List<CartM>.from(state.cart);
      int search = updateCart.indexWhere(
        (element) => element.id == event.product.id,
      );
      if (search == -1) return;
      final currentProduct = updateCart[search];

      if (currentProduct.quantity <= 1) {
        updateCart.removeAt(search);
      } else {
        updateCart[search] = currentProduct.copyWith(
          quantity: currentProduct.quantity - 1,
        );
      }
      final total = updateCart.fold<double>(
        0,
        (sum, item) => sum + item.price * item.quantity,
      );

      emit(ControlCartInitial(cart: updateCart, total: total));
    }
  }
}
