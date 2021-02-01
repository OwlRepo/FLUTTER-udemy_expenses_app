import 'package:flutter/material.dart';

import './TransactionModel.dart';
import './ExpenseItemContainer.dart';

class ExpenseList extends StatefulWidget {
  final List<TransactionModel> transaction;
  ExpenseList({this.transaction});

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  void showAlertDialog(BuildContext context, int index) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        setState(() {
          widget.transaction.removeAt(index);
        });
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Are you sure you want to delete this item?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: Text(
                  'List of Expenses',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            widget.transaction.isEmpty
                ? Center(
                    child: Text('List is empty.'),
                  )
                : Container(
                    height: 300.0,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ExpenseItemContainer(
                          title: widget.transaction[index].title,
                          amount: widget.transaction[index].amount
                              .ceilToDouble()
                              .toStringAsFixed(2),
                          date: widget.transaction[index].date,
                          deleteItem: () {
                            setState(() {
                              showAlertDialog(context, index);
                            });
                          },
                        );
                      },
                      itemCount: widget.transaction.length,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
