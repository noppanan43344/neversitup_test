import 'package:flutter/material.dart';
import 'package:neversitup/models/bitcoin_model.dart';
import 'package:neversitup/widgets/card_bitcoin.dart';

class HistoryPage extends StatelessWidget {
  final List<BitcoinModel>? bitcoins;
  const HistoryPage({super.key, this.bitcoins});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: bitcoins!.isEmpty
          ? const Center(
              child: Text('ยังไม่มีข้อมูล'),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: bitcoins?.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(bitcoins?[index].time?.updated ?? '-'),
                      const SizedBox(height: 10),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardBitcoin(
                              coin: bitcoins?[index].bpi?.eur,
                            ),
                            const SizedBox(height: 10),
                            CardBitcoin(
                              coin: bitcoins?[index].bpi?.gbp,
                            ),
                            const SizedBox(height: 10),
                            CardBitcoin(
                              coin: bitcoins?[index].bpi?.usd,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
