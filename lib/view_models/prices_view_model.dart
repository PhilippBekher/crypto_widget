import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/prices_list_model.dart';
import 'package:flutter_application_1/repo/api_status.dart';
import 'package:flutter_application_1/repo/prices_services.dart';

class PricesViewModel extends ChangeNotifier {
  bool _loading = false;
  DetailsObject? _pricesListModel;
  List<Object>? _prices;

  bool get loading => _loading;
  List<Object>? get pricesList => _prices;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  PricesViewModel() {
    getPrices();
  }

  setPricesListModel(List<Object> prices_list) {
    _prices = prices_list;
  }

  getPrices() async {
    setLoading(true);
    var response = await PriceServices.getPrices();

    setPricesListModel(response);

    setLoading(false);
    print('loading ended');
    print(response);
  }
}
