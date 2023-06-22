import 'package:flutter/material.dart';
import 'package:neversitup/api/api_helper.dart';
import 'package:neversitup/models/bitcoin_model.dart';

class BonusViewModel {
  late BuildContext _context;
  final textController = TextEditingController();
  late List<int> number = [];
  BonusViewModel(BuildContext context) {
    _context = context;
  }

  primeNumber() {
    number.clear();
    if (textController.text.isNotEmpty) {
      for (var i = 0; i <= int.parse(textController.text); i++) {
        if ((i != 1 && i % 2 != 0 && i % 3 != 0 && i % 5 != 0 && i % 7 != 0) || (i == 2 || i == 3 || i == 5 || i == 7)) {
          number.add(i);
        }
      }
    }
  }
}
