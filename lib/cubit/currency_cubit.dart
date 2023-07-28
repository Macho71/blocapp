part of "currency_state.dart";

class CurrencyCubit extends Cubit<CurrencyErorState> {
  CurrencyCubit() : super(const CurrencyInitialStatee()) {
    getCurrency();
  }
}
