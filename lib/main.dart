// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_element

import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/transactions_list.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';

import 'models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Quicksand',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.green,
            tertiary: Colors.blue),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
      id: DateTime.now().subtract(Duration(days: 5)).toString(),
      title: 'books',
      amount: 230,
      dateTime: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: DateTime.now().subtract(Duration(days: 2)).toString(),
      title: 'food',
      amount: 200,
      dateTime: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: DateTime.now().subtract(Duration(days: 4)).toString(),
      title: 'movies',
      amount: 650,
      dateTime: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: DateTime.now().subtract(Duration(days: 3)).toString(),
      title: 'T-Shirt',
      amount: 450,
      dateTime: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'tickets',
      amount: 350,
      dateTime: DateTime.now(),
    ),
  ];
  List<Transaction> get _recentTransactions {
    return transactions.where((element) {
      return element.dateTime
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime choosenDate) {
    final newTransaction = Transaction(
        title: txTitle,
        amount: txAmount,
        dateTime: choosenDate,
        id: DateTime.now().toString());
    setState(() {
      transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }

  void openNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: TextStyle(
            fontFamily: 'Aclonica',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => openNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_recentTransactions),
            TransactionList(
              transactions: transactions,
              deleteTransaction: _deleteTransaction,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => openNewTransaction(context),
      ),
    );
  }
}
