import 'package:flutter/material.dart';
import 'weekly_expense.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.green,
        fontFamily: 'Quicksand',
      ),
      home: WeeklyExpenses(),
    );
  }
}
