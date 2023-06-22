import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neversitup/screens/logic/logic_viewmodel.dart';

class Logic extends StatefulWidget {
  final int choice;
  const Logic({super.key, required this.choice});

  @override
  State<Logic> createState() => _LogicState();
}

class _LogicState extends State<Logic> {
  late LogicViewModel _model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = LogicViewModel(context);
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
        appBar: AppBar(title: Text('Logic ${widget.choice}')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              // maxLength: 6,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              controller: _model.textController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')), // 0-9
                LengthLimitingTextInputFormatter(6), // maxlength 6
              ],
            ),
            const SizedBox(height: 10),
            Text(_model.result ?? ''),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              logic(widget.choice);
            });
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }

  logic(int input) {
    switch (input) {
      case 1:
        return _model.logic1();
      case 2:
        return _model.logic2();
      case 3:
        return _model.logic3();
      default:
        return _model.logic4();
    }
  }
}
