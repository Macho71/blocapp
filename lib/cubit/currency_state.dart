import 'package:bloc/model/currency_model.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';

import 'package:hive/hive.dart';


part "currency_cubit.dart";
abstract class CurrencyState extends Equatable {
  const CurrencyState();
  @override
  List<Object?> get props => [];
}

class CurrencyInitialStatee extends CurrencyState {
  const CurrencyInitialStatee();
}

class CurrencyLoadingState extends CurrencyState {
  
  const CurrencyLoadingState();
}

class CurrencyErorState extends CurrencyState {
  const CurrencyErorState();
}

class CurrencyComplateState extends CurrencyState {
  final List<CurrencyModel> data;
  const CurrencyComplateState(this.data);
}

class HomeSuccessSms extends CurrencyState {
  const HomeSuccessSms();
}

class HomeError extends CurrencyState {
  final String error;
  const HomeError(this.error);
}
