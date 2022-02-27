import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'Yeezy Shoes', amount: 169.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 350.99, date: DateTime.now())
  ];

  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('CHART!'),
                  elevation: 5,
                ),
              ),
              Card(
                  elevation: 5,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            TextField(
                                decoration: InputDecoration(labelText: 'Title'),
                                controller: titleController
                                // onChanged: (val) {
                                //   titleInput = val;
                                // },
                                ),
                            TextField(
                                decoration:
                                    InputDecoration(labelText: 'Amount'),
                                controller: amountController
                                // onChanged: (val) => amountInput = val,
                                ),
                            ElevatedButton(
                                onPressed: () {
                                  print(titleController.text);
                                  print(amountController.text);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.purple)),
                                child: Text('Add Transaction'))
                          ]))),
              Column(
                children: transactions.map((tx) {
                  return Card(
                      child: Row(children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.deepPurple, width: 2)),
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
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ]));
                }).toList(),
              )
            ]));
  }
}
