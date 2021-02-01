import 'package:flutter/material.dart';

class ExpensesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 5.0,
      child: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
          child: Text(
            'Weekly Expense Chart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
