import 'package:flutter/material.dart';
import 'package:neversitup/models/bitcoin_model.dart';

class CardBitcoin extends StatelessWidget {
  final Eur? coin;
  const CardBitcoin({
    super.key,
    this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${coin?.code}',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              '${coin?.rateFloat}',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              '${coin?.description}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
