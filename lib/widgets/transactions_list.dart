// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Nothing added yet!',
                    style: TextStyle(fontSize: 30),
                  ),
                  Image.asset(
                    'assets/images/no_expenses.png',
                    // fit: BoxFit.contain,
                    height: 200,
                    // width: 200,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    elevation: 3,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'You have not added anything in your List ,click on ',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.pinkAccent),
                            ),
                            TextSpan(
                              text: ' add button ',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w900),
                            ),
                            TextSpan(
                              text: ' to find your recommendation.',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.pinkAccent),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            transactions[index].amount.toStringAsFixed(1),
                            style:
                                TextStyle(color: Colors.purple, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].dateTime),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
