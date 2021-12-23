import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TrnxList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TrnxList> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'Title 1',
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Title 2',
      amount: 1999,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Title 3',
      amount: 2999,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'Title 4',
      amount: 3999,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _userTransactions.map((trnx) {
        return Row(
          //Container 2(bottom Container)
          children: <Widget>[
            Container(
              //transaction amount with border box
              margin:
              EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  border:
                  Border.all(color: Colors.redAccent, width: 2)),
              padding: EdgeInsets.all(10),
              child: Text(
                'Rs ' + trnx.amount.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.redAccent),
              ),
            ),
            Column(
              // transaction title and date with yMMMd format
              // (column can't be decorated compared to container)
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    trnx.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87),
                  ),
                  Text(
                    DateFormat.yMMMd('en_US').format(trnx.date),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black38),
                  ),
                ]),
          ],
        );
      }).toList(),
    );
  }
}