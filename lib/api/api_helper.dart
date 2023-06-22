import 'package:neversitup/models/bitcoin_model.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();
  static Future<BitcoinModel?> getBitcoin() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://api.coindesk.com/v1/bpi/currentprice.json');
      var result = BitcoinModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
