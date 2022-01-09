import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      var totalSum = 0.0;
      final weekDay = DateTime.now().subtract(Duration(days: index));
      for (var i = 0; i < recentTransactions.length; i++) {
        if (weekDay.day == recentTransactions[i].dateTime.day &&
            weekDay.month == recentTransactions[i].dateTime.month &&
            weekDay.year == recentTransactions[i].dateTime.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {'day': (DateFormat.E().format(weekDay)), 'amount': totalSum};
    });
  }

  double get totalAmount {
    return groupedTransactionValues.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                spendingAmount: data['amount'],
                spendingPctOfTotal:
                    totalAmount == 0.0 ? 0.0 : (data['amount'] / totalAmount),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
