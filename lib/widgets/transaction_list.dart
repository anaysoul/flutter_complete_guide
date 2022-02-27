import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
            child: Row(children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple, width: 2)),
            child: Text(
              '\$${tx.amount}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
            padding: EdgeInsets.all(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(tx.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              Text(
                DateFormat.yMMMMd().format(tx.date),
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ]));
      }).toList(),
    );
  }
}
