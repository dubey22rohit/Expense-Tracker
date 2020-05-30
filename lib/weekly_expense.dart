import 'package:expenses_app/new_transactions.dart';
import 'package:expenses_app/transaction_list.dart';
import 'package:expenses_app/weekchart.dart';
import 'transaction_list.dart';
import 'package:flutter/material.dart';
import 'transactions.dart';

class WeeklyExpenses extends StatefulWidget {
  // String inputTitle = "";
  // String inputAmount = "";
  @override
  _WeeklyExpensesState createState() => _WeeklyExpensesState();
}

class _WeeklyExpensesState extends State<WeeklyExpenses> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  List<Transactions> _userTransactions = [];
  void _addNewTransaction(String txTitle, double txAmount,DateTime chosenDate) {
    final newTx = Transactions(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransactions(_addNewTransaction);
      },
    );
  }
  void _deleteTransactions(String id){
    setState(() {
    return _userTransactions.removeWhere((element) => element.id == id);  
    });
    
  }

  List<Transactions> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            WeekChart(_recentTransactions),
            TransactionList(_userTransactions,_deleteTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
