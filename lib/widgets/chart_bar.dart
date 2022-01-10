// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart.dart';

class ChartBar extends StatelessWidget {
  ChartBar(
      {required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal});
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text('\u{20B9}${spendingAmount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey.shade400,
                  border: Border.all(color: Colors.blueGrey, width: 1),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(label),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
