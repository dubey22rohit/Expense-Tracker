import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addTx;

  NewTransactions(this.addTx);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    final entrerdTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (entrerdTitle == null || enteredAmount < 0 || enteredAmount == null || _selectedDate == null) {
      return;
    }
    widget.addTx(
      entrerdTitle,
      enteredAmount,
      _selectedDate
    );
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
      _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (val){
              //   inputTitle = val;
              // },
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val)=> inputAmount = val,
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Text(
                    _selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}',
                  ),
                  FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                    onPressed: presentDatePicker,
                  )
                ],
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              child: FlatButton(
                onPressed: submitData,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                textColor: Theme.of(context).primaryColorDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
