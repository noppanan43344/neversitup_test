import 'package:flutter/material.dart';
import 'package:neversitup/screens/bitcoin/bitcoin_page.dart';
import 'package:neversitup/screens/bonus/bonus_page.dart';
import 'package:neversitup/screens/logic/logic_page.dart';
import 'package:neversitup/widgets/card_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CardText(
            text: 'Bitcoin',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BitcoinPage()));
            },
          ),
          CardText(
            text: 'Logic',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LogicPage()));
            },
          ),
          CardText(
            text: 'Bonus',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BonusPage()));
            },
          ),
        ],
      ),
    );
  }
}
