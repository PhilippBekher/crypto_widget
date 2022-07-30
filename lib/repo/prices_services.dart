import 'dart:io';

import 'package:flutter_application_1/models/prices_list_model.dart';
import 'package:flutter_application_1/repo/api_status.dart';
import 'package:http/http.dart' as http;

class PriceServices {
  static Future<List<Object>> getPrices() async {
    try {
      var url = Uri.parse(
          'https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=1');
      var response = await http.get(url);
      final DetailsObject detailsObject = detailsObjectFromJson(response.body);
      final List<List<double>> prices = detailsObject.prices;

      return prices;
    } catch (e) {
      print(e);
      return <double>[];
    }
  }
}
