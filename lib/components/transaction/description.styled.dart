import 'package:flutter/material.dart';

class StyledDescription extends StatelessWidget {
  final String title;
  final String date;

  const StyledDescription(this.title, this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        date,
        style: TextStyle(
          color: Colors.grey[700],
        ),
      ),
    ]);
  }
}
