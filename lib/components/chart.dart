import 'package:despesas_pessoais/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions, this.hasTransactions, {Key? key})
      : super(key: key);

  final List<Transaction> recentTransactions;
  final bool hasTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMon = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameYear && sameDay && sameMon) {
          totalSum += recentTransactions[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (acc, item) {
      return (acc + (item['value'] as double));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ...groupedTransactions.map(
              (e) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: e['day'] as String,
                    value: e['value'] as double,
                    percentage: hasTransactions
                        ? (e['value'] as double) / (_weekTotalValue)
                        : 0,
                  ),
                );
              },
            ).toList()
          ],
        ),
      ),
    );
  }
}
