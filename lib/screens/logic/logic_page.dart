import 'package:flutter/material.dart';
import 'package:neversitup/screens/logic/logic.dart';
import 'package:neversitup/widgets/card_text.dart';


class LogicPage extends StatefulWidget {
  const LogicPage({super.key});

  @override
  State<LogicPage> createState() => _LogicPageState();
}

class _LogicPageState extends State<LogicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logic')),
      body: Column(
        children: [
          CardText(
            text: 'Logic 1',
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Logic(choice: 1)));
            },
          ),
          CardText(
            text: 'Logic 2',
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Logic(choice: 2)));
            },
          ),
          CardText(
            text: 'Logic 3',
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Logic(choice: 3)));
            },
          ),
          CardText(
            text: 'Logic 4',
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Logic(choice: 4)));
            },
          ),
        ],
      ),
    );
  }
}
