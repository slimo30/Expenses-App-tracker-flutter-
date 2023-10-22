import 'package:expences_new_app/Models/expense.dart';
import 'package:expences_new_app/Widgets/chart/chart.dart';
import 'package:expences_new_app/Widgets/expense_list/newExpense.dart';
import 'package:flutter/material.dart';

import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regesterdExpenses = [
    Expense(
        category: Category.food,
        titel: 'chawarma',
        amount: 250,
        date: DateTime.now()),
    Expense(
        category: Category.food,
        titel: 'Tacos',
        amount: 250,
        date: DateTime.now()),
    Expense(
        category: Category.travel,
        titel: 'Hotel ',
        amount: 250,
        date: DateTime.now())
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _regesterdExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _regesterdExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Expense tracking app'),
        leading: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (ctx) => NewExpense(
                onAddExpense: _addExpense,
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Chart(
            Expenses: _regesterdExpenses,
          ),
          Expanded(
            child: ExpensesList(
              regesterdExpenses: _regesterdExpenses,
              onremoveExpense: _removeExpense,
            ),
          )
        ]),
      ),
    );
  }
}
