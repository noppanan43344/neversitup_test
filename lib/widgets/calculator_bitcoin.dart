import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorBitcoin extends StatelessWidget {
  final TextEditingController controller;
  final Function() onTap;
  final String bitcoin;
  const CalculatorBitcoin({super.key, required this.controller, required this.onTap, required this.bitcoin});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            controller: controller,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[.]{0,1}[0-9]*')), // check decimal
            ],
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () => onTap(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.blue,
              ),
              child: const Center(child: Text('OK')),
            ),
          ),
          const SizedBox(height: 10),
          Text('$bitcoin BTC')
        ],
      ),
    );
  }
}
