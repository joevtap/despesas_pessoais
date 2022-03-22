import 'package:despesas_pessoais/components/transaction/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction/transaction_list.dart';
import 'package:flutter/material.dart';

import '../../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis',
      value: 340.12,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Novo Celular',
      value: 1190.12,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transactions),
        TransactionForm(),
      ],
    );
  }
}
