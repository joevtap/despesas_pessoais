import 'package:despesas_pessoais/components/transaction/description.styled.dart';
import 'package:despesas_pessoais/components/transaction/value.styled.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final double value;
  final String title;
  final String date;

  const TransactionCard({
    Key? key,
    required this.value,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          StyledValue(value),
          StyledDescription(title, date),
        ],
      ),
    );
  }
}
