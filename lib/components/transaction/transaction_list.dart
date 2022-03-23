import 'package:despesas_pessoais/components/transaction/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String id) delete;

  const TransactionList({
    Key? key,
    required this.transactions,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Text(
                    'Nenhuma transação cadastrada!',
                    style: theme(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.3,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];

              return TransactionCard(
                id: tr.id,
                delete: delete,
                value: tr.value,
                title: tr.title,
                date: DateFormat.yMMMMd().format(tr.date),
              );
            },
          );
  }

  ThemeData theme(BuildContext context) => Theme.of(context);
}
