import 'package:bloc_test/bloc_test.dart';
import 'package:ecommerce/features/cart/bloc/control_cart_bloc/control_cart_bloc.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:flutter_test/flutter_test.dart';

// Fresh items keep expected values independent of mutable events and states.
CartM product({int id = 1, int quantity = 1, int price = 20}) => CartM(
      id: id,
      name: 'Product $id',
      quantity: quantity,
      price: price,
      category: 'Test',
      image: 'images/test.png',
    );

ControlCartInitial cartState(List<CartM> items, double total) =>
    ControlCartInitial(cart: items, total: total);

// Subscribe before dispatching. Wait for each transition without fixed delays.
Future<void> dispatch(ControlCartBloc bloc, ControlCartEvent event) async {
  final nextState = bloc.stream.first;
  bloc.add(event);
  await nextState;
}

void main() {
  group('ControlCartBloc', () {
    blocTest<ControlCartBloc, ControlCartInitial>(
      'starts empty and emits nothing without events',
      build: ControlCartBloc.new,
      expect: () => [],
      verify: (bloc) {
        expect(bloc.state.cart, isEmpty);
        expect(bloc.state.total, 0);
      },
    );

    blocTest<ControlCartBloc, ControlCartInitial>(
      'adds the first product with the correct quantity and total',
      build: ControlCartBloc.new,
      act: (bloc) => bloc.add(AddProduct(product())),
      expect: () => [
        cartState([product()], 20)
      ],
    );

    blocTest<ControlCartBloc, ControlCartInitial>(
      'adding an existing ID increases quantity without duplicating the item',
      build: ControlCartBloc.new,
      seed: () => cartState([product()], 20),
      act: (bloc) => bloc.add(AddProduct(product())),
      expect: () => [
        cartState([product(quantity: 2)], 40)
      ],
    );

    blocTest<ControlCartBloc, ControlCartInitial>(
      'repeated additions and a different product retain correct state history',
      build: ControlCartBloc.new,
      act: (bloc) async {
        await dispatch(bloc, AddProduct(product()));
        await dispatch(bloc, AddProduct(product()));
        await dispatch(bloc, AddProduct(product(id: 2, price: 5)));
        await dispatch(bloc, AddProduct(product()));
      },
      expect: () => [
        cartState([product()], 20),
        cartState([product(quantity: 2)], 40),
        cartState([product(quantity: 2), product(id: 2, price: 5)], 45),
        cartState([product(quantity: 3), product(id: 2, price: 5)], 65),
      ],
    );

    blocTest<ControlCartBloc, ControlCartInitial>(
      'a new item with multiple units totals price times quantity',
      build: ControlCartBloc.new,
      act: (bloc) => bloc.add(AddProduct(product(quantity: 3))),
      expect: () => [
        cartState([product(quantity: 3)], 60)
      ],
    );

    blocTest<ControlCartBloc, ControlCartInitial>(
      'decreases quantity by one and preserves other products and their total',
      build: ControlCartBloc.new,
      seed: () =>
          cartState([product(quantity: 2), product(id: 2, price: 5)], 45),
      act: (bloc) => bloc.add(LowerQuantity(product())),
      expect: () => [
        cartState([product(), product(id: 2, price: 5)], 25)
      ],
    );

    blocTest<ControlCartBloc, ControlCartInitial>(
      'decreasing quantity preserves other products and uses the stored price',
      build: ControlCartBloc.new,
      seed: () =>
          cartState([product(quantity: 2), product(id: 2, price: 5)], 45),
      // Events identify the item; stale event prices must not corrupt totals.
      act: (bloc) => bloc.add(LowerQuantity(product(price: 999))),
      expect: () => [
        cartState([product(), product(id: 2, price: 5)], 25)
      ],
    );

    blocTest<ControlCartBloc, ControlCartInitial>(
      'decreasing the last unit removes the item and empties the cart',
      build: ControlCartBloc.new,
      seed: () => cartState([product()], 20),
      act: (bloc) => bloc.add(LowerQuantity(product())),
      expect: () => [cartState([], 0)],
    );

    blocTest<ControlCartBloc, ControlCartInitial>(
      'removes all stored units, preserves other items, then empties the cart',
      build: ControlCartBloc.new,
      seed: () =>
          cartState([product(quantity: 3), product(id: 2, price: 5)], 65),
      act: (bloc) async {
        await dispatch(bloc, DeleteProduct(product(quantity: 3)));
        await dispatch(bloc, DeleteProduct(product(id: 2, price: 5)));
      },
      expect: () => [
        cartState([product(id: 2, price: 5)], 5),
        cartState([], 0),
      ],
    );

    blocTest<ControlCartBloc, ControlCartInitial>(
      'removes all units of an item, then removes the final product',
      build: ControlCartBloc.new,
      seed: () =>
          cartState([product(quantity: 3), product(id: 2, price: 5)], 65),
      act: (bloc) async {
        // Deliberately stale quantity and price: delete the stored item by ID.
        await dispatch(bloc, DeleteProduct(product(price: 999)));
        await dispatch(bloc, DeleteProduct(product(id: 2, price: 5)));
      },
      expect: () => [
        cartState([product(id: 2, price: 5)], 5),
        cartState([], 0),
      ],
    );

    for (final operation in ['delete', 'decrease']) {
      blocTest<ControlCartBloc, ControlCartInitial>(
        '$operation of an unknown ID leaves the cart unchanged without errors',
        build: ControlCartBloc.new,
        seed: () => cartState([product()], 20),
        act: (bloc) => bloc.add(operation == 'delete'
            ? DeleteProduct(product(id: 99))
            : LowerQuantity(product(id: 99))),
        expect: () => <ControlCartInitial>[],
        errors: () => <Object>[],
        verify: (bloc) => expect(bloc.state, cartState([product()], 20)),
      );
    }

    for (final operation in ['add', 'decrease']) {
      late ControlCartInitial previousState;
      blocTest<ControlCartBloc, ControlCartInitial>(
        '$operation creates a new state without mutating the previous item',
        build: ControlCartBloc.new,
        seed: () {
          previousState = cartState([product(quantity: 2)], 40);
          return previousState;
        },
        act: (bloc) => bloc.add(operation == 'add'
            ? AddProduct(product())
            : LowerQuantity(product())),
        expect: () => [
          cartState([product(quantity: operation == 'add' ? 3 : 1)],
              operation == 'add' ? 60 : 20),
        ],
        verify: (bloc) {
          expect(previousState, cartState([product(quantity: 2)], 40));
          expect(identical(bloc.state, previousState), isFalse);
          expect(identical(bloc.state.cart, previousState.cart), isFalse);
          expect(identical(bloc.state.cart.single, previousState.cart.single),
              isFalse);
        },
      );
    }
  });
}
