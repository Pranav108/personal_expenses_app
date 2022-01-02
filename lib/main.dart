// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:personal_expenses/widgets/user_transaction.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appBar'),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
          child: Container(
        child: UserTransaction(),
      )),
    );
  }
}
