import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(children: <Widget>[
              Text('No transactions were found!',
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 20),
              Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover))
            ])
          : ListView.builder(
              itemBuilder: (context, index) {
                // return Card(
                //     child: Row(children: <Widget>[
                //   Container(
                //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //     decoration: BoxDecoration(
                //         border: Border.all(
                //             color: Theme.of(context).primaryColor, width: 2)),
                //     child: Text(
                //       '\$${transactions[index].amount.toStringAsFixed(2)}',
                //       style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 20,
                //         color: Theme.of(context).primaryColor,
                //       ),
                //     ),
                //     padding: EdgeInsets.all(10),
                //   ),
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Text(transactions[index].title,
                //           style: Theme.of(context).textTheme.titleMedium),
                //       Text(
                //         DateFormat.yMMMMd().format(transactions[index].date),
                //         style: TextStyle(
                //             color: Colors.blueGrey,
                //             fontWeight: FontWeight.bold),
                //       )
                //     ],
                //   ),
                // ]));

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        )),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(
                            onPressed: () => deleteTx(transactions[index].id),
                            icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).errorColor),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => deleteTx(transactions[index].id),
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
