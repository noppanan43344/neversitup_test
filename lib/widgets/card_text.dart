import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CardText({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
