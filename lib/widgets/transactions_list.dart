// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        child: Text(
                          transactions[index].amount.toStringAsFixed(2),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Text(
                            transactions[index].dateTime.toString(),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
