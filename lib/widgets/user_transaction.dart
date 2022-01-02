// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transactions_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(
      id: 'a1',
      title: 'books',
      amount: 99.9,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: 'a2',
      title: 'food',
      amount: 49.9,
      dateTime: DateTime.now(),
    ),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTransaction = Transaction(
        title: txTitle,
        amount: txAmount,
        dateTime: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          NewTransaction(_addNewTransaction),
          TransactionList(
            transactions: transactions,
          ),
        ],
      ),
    );
  }
}
