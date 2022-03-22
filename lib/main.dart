import 'package:despesas_pessoais/components/transaction/main.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
            Column(
              children: _transactions.map((tr) {
                return TransactionCard(
                  value: tr.value,
                  title: tr.title,
                  date: DateFormat.yMMMMd().format(tr.date),
                );
              }).toList(),
            ),
          ]),
    );
  }
}
