import 'dart:io';

import 'package:bloc/model/currency_model.dart';
import 'package:bloc/service/currency_service.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


class CurrencyRepozitory {
  CurrencyRepozitory currencyRepozitory = CurrencyRepozitory();
  Box<CurrencyModel>? currencyBox;

  Future<dynamic> getCurrency() async {
    dynamic serverResponse = await CurrencyService.getCurrency();
    if (serverResponse is List<CurrencyModel>) {
      await openBox();
      await writeToBox(serverResponse);
      if (currencyBox!.isEmpty) {
        return "Hali ma'lomotlar mavjud emas";
      } else {
        return currencyBox;
      }
    } else {
      return serverResponse;
    }
  }

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    currencyBox = await Hive.openBox<CurrencyModel>("currency");
  }

  Future<void> writeToBox(List<CurrencyModel> data) async {
    await currencyBox!.clear();
    for (int i = 0; i < data.length; i++) {
      await currencyBox!.add(data[i]);
    }
  }
  static void registerAdapter(){
   // Hive.registerAdapter()
  }
}
