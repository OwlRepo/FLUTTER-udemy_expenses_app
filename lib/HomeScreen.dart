import 'package:flutter/material.dart';

import 'ExpenseList.dart';
import 'ExpensesChart.dart';
import 'NewTransaction.dart';
import 'TransactionModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TransactionModel> transactions = [
    TransactionModel(
        title: 'Test1',
        id: DateTime.now().toString(),
        amount: 20.0,
        date: DateTime.now()),
  ];

  void _addNewTransaction(String title, String amount) {
    final newTransaction = TransactionModel(
      id: DateTime.now().toString(),
      title: title,
      amount: double.parse(amount),
      date: DateTime.now(),
    );

    setState(() {
      transactions.add(newTransaction);
    });
  }

  void _showAddNewTransactionModalBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: (ctx),
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return NewTransaction(
            newTransactionFunction: _addNewTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNewTransactionModalBottomSheet(context),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Flutter Expenses App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddNewTransactionModalBottomSheet(context),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Weekly Expense Chart
                ExpensesChart(),
                //List of Expenses
                ExpenseList(
                  transaction: transactions,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
