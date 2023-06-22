import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neversitup/screens/bonus/bonus_viewmodel.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({super.key});

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  late BonusViewModel _model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = BonusViewModel(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _model.textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Prime Number')),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                controller: _model.textController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
              ),
              const SizedBox(height: 10),
              Text(_model.number.isEmpty ? '' : _model.number.toString()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            setState(() {
              _model.primeNumber();
            });
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
