// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  void openNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('appBar'),
        actions: [
          IconButton(
            onPressed: () => openNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Container(
          child: TransactionList(
            transactions: transactions,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => openNewTransaction(context),
      ),
    );
  }
}
