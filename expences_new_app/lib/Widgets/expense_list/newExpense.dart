import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../Models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titelController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Category _selectedCategory = Category.food;

  @override
  void dispose() {
    _titelController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            controller: _titelController,
            maxLength: 50,
            decoration: InputDecoration(
              label:
                  Text('Titel', style: Theme.of(context).textTheme.labelLarge),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: 'DA ',
                    label: Text(
                      'Amount',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Select Date :',
                            style: Theme.of(context).textTheme.labelLarge),
                        IconButton(
                            onPressed: () async {
                              final now = DateTime.now();
                              final firstdate = DateTime(
                                  DateTime.now().year - 10,
                                  DateTime.now().month,
                                  DateTime.now().day);
                              final lastdate = DateTime(
                                  DateTime.now().year + 10,
                                  DateTime.now().month,
                                  DateTime.now().day);
                              DateTime? PickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: now,
                                  firstDate: firstdate,
                                  lastDate: lastdate);

                              if (PickedDate != null &&
                                  PickedDate != selectedDate) {
                                setState(() {
                                  selectedDate = PickedDate;
                                });
                              }
                            },
                            icon: Icon(Icons.calendar_month))
                      ],
                    ),
                    Text(dateFormat.format(selectedDate),
                        style: Theme.of(context).textTheme.labelLarge)
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButton(
            value: _selectedCategory,
            onChanged: (Category? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedCategory = newValue;
                });
              }
            },
            underline: Container(
              height: 1,
              color: Colors.black,
            ),
            items: Category.values.map((Category category) {
              return DropdownMenuItem(
                value: category,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(category.name.toUpperCase(),
                      style: Theme.of(context).textTheme.labelLarge),
                ),
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final double? enteramount =
                      double.tryParse(_amountController.text);
                  final bool amountIsInvalide =
                      (enteramount == null || enteramount < 0);
                  if (_titelController.text.trim().isEmpty ||
                      amountIsInvalide) {
                    debugPrint('error');
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text('Invalid Inpits'),
                              content: Text(
                                  'Complete Infos ..............................................................'),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(ctx),
                                    child: Text('Okay'))
                              ],
                            ));
                  } else {
                    widget.onAddExpense(Expense(
                        category: _selectedCategory,
                        titel: _titelController.text,
                        amount: enteramount,
                        date: selectedDate));
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
