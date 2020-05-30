import 'package:expenses_app/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500.0,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No Transactions added yet!',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 5.0),
                          child: FittedBox(
                            child: Text('₹${transactions[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25.0,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(
                          transactions[index].date,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => deleteTx(transactions[index].id),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
