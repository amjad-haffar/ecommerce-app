import 'package:ecommerce/features/cart/bloc/control_cart_bloc/control_cart_bloc.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('CartBloc', () {
    ControlCartBloc build() {
      return ControlCartBloc();
    }
    test('has correct inital state', () {
      expect(build().state, equals(ControlCartInitial(cart: [], total: 0)));
    });
    blocTest<ControlCartBloc, ControlCartInitial>(
      'emits state when adding.',
      build: () => ControlCartBloc(),
      act: (bloc) => bloc.add(AddProduct(
        CartM(
          id: 1,
          name: 'n',
          quantity: 1,
          price: 20,
          category: 'c',
          image: 'i',
        ),
      )),
      seed: () => ControlCartInitial(cart: [
          CartM(
              id: 1,
              name: 'n',
              quantity: 1,
              price: 20,
              category: 'c',
              image: 'i')
        ], total: 20),
      expect: () => <ControlCartInitial>[
        ControlCartInitial(cart: [
          CartM(
              id: 1,
              name: 'n',
              quantity: 2,
              price: 20,
              category: 'c',
              image: 'i')
        ], total: 40),
      ],
    );
  });
}
