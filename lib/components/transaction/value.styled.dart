import 'package:flutter/material.dart';

class StyledValue extends StatelessWidget {
  final double value;

  const StyledValue(
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        'R\$ ${value.toStringAsFixed(2)}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }
}
