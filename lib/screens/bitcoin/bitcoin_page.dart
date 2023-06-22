import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neversitup/models/bitcoin_model.dart';
import 'package:neversitup/screens/bitcoin/bitcoin_viewmol.dart';
import 'package:neversitup/screens/bitcoin/history_page.dart';
import 'package:neversitup/widgets/calculator_bitcoin.dart';
import 'package:neversitup/widgets/card_bitcoin.dart';

class BitcoinPage extends StatefulWidget {
  const BitcoinPage({super.key});

  @override
  State<BitcoinPage> createState() => _BitcoinPageState();
}

class _BitcoinPageState extends State<BitcoinPage> {
  late BitcoinViewModel _model;
  late Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = BitcoinViewModel(context);
    _future = _model.getBitcoin();
    setUp();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _model.timer.cancel();
  }

  setUp() {
    _model.timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      if (mounted) {
        setState(() {
          _future = _model.getBitcoin();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Bitcoin')),
        body: FutureBuilder<dynamic>(
          future: _future,
          builder: (context, AsyncSnapshot snapshot) {
            if (_model.isLoad == false && snapshot.connectionState == ConnectionState.waiting) {
              _model.isLoad = true;
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Text('เกิดข้อผิดพลาด');
            } else {
              BitcoinModel? bitcoin = snapshot.data;
              if (_model.bitcoins!.isNotEmpty) {
                if (_model.bitcoins?.where((element) => element.time?.updated == bitcoin?.time?.updated).isEmpty == true) {
                  _model.bitcoins?.add(bitcoin!);
                }
              } else {
                _model.bitcoins?.add(bitcoin!);
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardBitcoin(
                            coin: _model.bitcoins?[_model.bitcoins!.length - 1].bpi?.eur,
                          ),
                          const SizedBox(height: 10),
                          CardBitcoin(
                            coin: _model.bitcoins?[_model.bitcoins!.length - 1].bpi?.gbp,
                          ),
                          const SizedBox(height: 10),
                          CardBitcoin(
                            coin: _model.bitcoins?[_model.bitcoins!.length - 1].bpi?.usd,
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CalculatorBitcoin(
                            controller: _model.eurController,
                            onTap: () {
                              setState(() {
                                _model.eurToBitcoin();
                              });
                            },
                            bitcoin: _model.eur.toString()),
                        const SizedBox(width: 5),
                        CalculatorBitcoin(
                            controller: _model.gbpController,
                            onTap: () {
                              setState(() {
                                _model.gbpToBitcoin();
                              });
                            },
                            bitcoin: _model.gbp.toString()),
                        const SizedBox(width: 5),
                        CalculatorBitcoin(
                            controller: _model.usdController,
                            onTap: () {
                              setState(() {
                                _model.usdToBitcoin();
                              });
                            },
                            bitcoin: _model.usd.toString()),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage(bitcoins: _model.bitcoins)));
          },
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
