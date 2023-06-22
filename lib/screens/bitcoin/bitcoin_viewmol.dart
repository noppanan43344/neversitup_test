import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neversitup/api/api_helper.dart';
import 'package:neversitup/models/bitcoin_model.dart';

class BitcoinViewModel {
  late BuildContext _context;
  bool isLoad = false;
  List<BitcoinModel>? bitcoins = [];
  late Timer timer;
  double usd = 0.0;
  double eur = 0.0;
  double gbp = 0.0;
  final usdController = TextEditingController();
  final eurController = TextEditingController();
  final gbpController = TextEditingController();
  BitcoinViewModel(BuildContext context) {
    _context = context;
  }

  getBitcoin() async {
    BitcoinModel? results = await ApiHelper.getBitcoin();
    return results;
  }

  eurToBitcoin() {
    if (eurController.text.isNotEmpty) {
      eur = double.parse((double.parse(eurController.text) / (bitcoins?[bitcoins!.length - 1].bpi?.eur?.rateFloat ?? 0)).toStringAsFixed(6));
    }
  }

  gbpToBitcoin() {
    if (gbpController.text.isNotEmpty) {
      gbp = double.parse((double.parse(gbpController.text) / (bitcoins?[bitcoins!.length - 1].bpi?.gbp?.rateFloat ?? 0)).toStringAsFixed(6));
    }
  }

  usdToBitcoin() {
    if (usdController.text.isNotEmpty) {
      usd = double.parse((double.parse(usdController.text) / (bitcoins?[bitcoins!.length - 1].bpi?.usd?.rateFloat ?? 0)).toStringAsFixed(6));
    }
  }
}
