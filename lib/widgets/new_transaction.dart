// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  void _onSubmitted() {
    var titleText = _titleController.text;
    var amountText = double.parse(_amountController.text);
    if (titleText.isEmpty ||
        amountText.isNaN ||
        amountText < 0 ||
        _selectedDate == null) return;
    widget.addTx(titleText, amountText, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((choosenDate) {
      if (choosenDate == null) return;
      setState(() {
        _selectedDate = choosenDate;
        FocusScope.of(context)
            .requestFocus(FocusNode()); //to close the keyboard
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        shadowColor: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                onSubmitted: (_) => _onSubmitted(),
                decoration: InputDecoration(labelText: 'title'),
                controller: _titleController,
                onChanged: (value) {},
              ),
              TextField(
                onSubmitted: (_) => _onSubmitted(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'amount'),
                controller: _amountController,
              ),
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'no date choosen'
                          : 'choosen date : ${DateFormat.yMd().format(_selectedDate!)}',
                    ),
                    TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'choose Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _onSubmitted,
                child: Text(
                  'add item',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
