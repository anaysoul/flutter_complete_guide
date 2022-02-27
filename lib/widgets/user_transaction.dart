import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

final List<Transaction> _userTransaction = [
  Transaction(
      id: 't1', title: 'Yeezy Shoes', amount: 169.99, date: DateTime.now()),
  Transaction(
      id: 't2', title: 'Groceries', amount: 350.99, date: DateTime.now())
];

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[NewTransaction(), TransactionList()]);
  }
}
