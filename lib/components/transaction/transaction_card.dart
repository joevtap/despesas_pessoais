import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final double value;
  final String title;
  final String date;
  final String id;
  final void Function(String id) delete;

  const TransactionCard(
      {Key? key,
      required this.value,
      required this.id,
      required this.title,
      required this.date,
      required this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text(
                  value.toStringAsFixed(2),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(date),
          trailing: IconButton(
            icon:
                Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
            onPressed: () {
              delete(id);
            },
          ),
        ),
      ),
    );
  }
}
