import 'package:bloc/model/currency_model.dart';
import 'package:dio/dio.dart';


class CurrencyService {
 static Future<dynamic> getCurrency() async {
    try {
      Response response = await Dio(BaseOptions(validateStatus: (status) {
        if (status! >= 100 && status <= 599) {
          return true;
        } else {
          return false;
        }
      },
      receiveTimeout: const Duration(seconds: 55),

      )).get("https://nbu.uz/uz/exchange-rates/json/");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CurrencyModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
