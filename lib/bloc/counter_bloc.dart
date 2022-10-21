import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(CounterInit()) {
    on<AddTwo>((event, emit) {
      ++index == index++;
      emit(CounterSucces());
    });
    on<ReduceOne>((event, emit) {
      if (index > 0) {
        --index;
      } else {
        null;
      }
      emit(CounterSucces());
    });
    on<ClearAll>((event, emit) {
      index = 0;
      emit(CounterSucces());
    });

    // on<ChangeTheme>((event, emit) {      //Не удавшаяся функция(
    //   if (theme != ThemeData.dark()) {
    //     theme = ThemeData.dark();
    //     emit(CounterSucces());
    //   } else {
    //     theme = ThemeData.light();
    //   }
    //   print(theme);
    // });
  }
  int index = 0;
  // ThemeData theme = ThemeData.light();
}

abstract class CounterEvents {}

class AddTwo extends CounterEvents {}

class ReduceOne extends CounterEvents {}

class ClearAll extends CounterEvents {}

class ChangeTheme extends CounterEvents {}

//
abstract class CounterStates {}

class CounterInit extends CounterStates {}

class CounterSucces extends CounterStates {}
