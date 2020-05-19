import 'package:flutter/material.dart';
import 'weekly_expence.dart';
void main(){
  runApp(ExpensesApp());
}
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:WeeklyExpense(),
    );
  }
}