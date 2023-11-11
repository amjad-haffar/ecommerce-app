import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/API/repository.dart';
import 'package:ecommerce/model/product.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository homeRepo;
  HomeBloc(this.homeRepo) : super(HomeInitial()) {
    on<HomeInitalEvent>(homeInitalEvent);
  }
  FutureOr<void> homeInitalEvent(
      HomeInitalEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final data = await homeRepo.getAllProduct();
    data.fold((l) => emit(HomeErrorState(error: l.props.first.toString())),
        ((r) => emit(HomeLoadedState(products: r))));
  }
}
