import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreState{
  StoreState({required this.counter});
  int counter = 0;
}


class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreState(counter: 0));

  /// Add 1 to the current state.
  void increment() => emit(StoreState(counter: state.counter + 1));



  /// Subtract 1 from the current state.
  void decrement() => emit(StoreState(counter: state.counter - 1));
}