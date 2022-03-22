import 'package:despesas_pessoais/components/transaction/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tr) {
        return TransactionCard(
          value: tr.value,
          title: tr.title,
          date: DateFormat.yMMMMd().format(tr.date),
        );
      }).toList(),
    );
  }
}
