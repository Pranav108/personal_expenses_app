// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx, {Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void onSubmitted() {
    var titleText = titleController.text;
    var amountText = double.parse(amountController.text);
    if (titleText.isEmpty || amountText.isNaN || amountText < 0) return;
    addTx(titleText, amountText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                onSubmitted: (_) => onSubmitted(),
                decoration: InputDecoration(labelText: 'title'),
                controller: titleController,
                onChanged: (value) {},
              ),
              TextField(
                onSubmitted: (_) => onSubmitted(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'amount'),
                controller: amountController,
              ),
              TextButton(
                onPressed: onSubmitted,
                child: Text(
                  'add item',
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
