import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransactionFunction;

  NewTransaction({this.newTransactionFunction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          )),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              child: Text(
                'Add new transaction',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextField(
            controller: titleController,
            maxLines: 1,
            autofocus: true,
            textInputAction: TextInputAction.next,
            onEditingComplete: () => node.nextFocus(),
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: amountController,
            onSubmitted: (_) {
              if (titleController.text.isEmpty ||
                  double.parse(amountController.text) <= 0) {
                Fluttertoast.showToast(
                    msg: "Invalid inputs.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                return;
              }

              widget.newTransactionFunction(
                  titleController.text, amountController.text);
              Navigator.of(context).pop();
            },
            maxLines: 1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
          ),
          FlatButton(
            onPressed: () {
              if (titleController.text.isEmpty ||
                  double.parse(amountController.text) <= 0) {
                Fluttertoast.showToast(
                    msg: "Invalid inputs.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                return;
              }

              widget.newTransactionFunction(
                  titleController.text, amountController.text);
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
