import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
              // textTheme: ThemeData.light().textTheme.copyWith(
              //     title: TextStyle(fontFamily: 'OpenSans', fontSize: 20)))
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'Yeezy Shoes', amount: 169.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 350.99, date: DateTime.now())
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NewTransaction(_addNewTransaction),
              behavior: HitTestBehavior.opaque);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text('Personal Expenses'),
            // trailing: CupertinoButton(
            //     child: const Text('Add'),
            //     onPressed: () => _startAddNewTransaction(context)),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context))
            ]),
            backgroundColor: Color.fromRGBO(103, 58, 183, 1),
          )
        : AppBar(
            title: Text('Personal Expenses',
                style: TextStyle(fontFamily: 'Open Sans')),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _startAddNewTransaction(context))
            ],
          );
    final txListWidget = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            1,
        child: TransactionList(_userTransactions, _deleteTransaction));

    final pageBody = SingleChildScrollView(
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape == true)
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Show Chart'),
                    Switch.adaptive(
                        activeColor: Theme.of(context).toggleableActiveColor,
                        value: _showChart,
                        onChanged: (val) {
                          setState(() {
                            _showChart = val;
                          });
                        })
                  ]),
            if (!isLandscape)
              Container(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      .3,
                  child: Chart(_recentTransactions)),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          .6,
                      child: Chart(_recentTransactions))
                  : txListWidget,
          ]),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(child: pageBody, navigationBar: appBar)
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context)),
          );
  }
}
