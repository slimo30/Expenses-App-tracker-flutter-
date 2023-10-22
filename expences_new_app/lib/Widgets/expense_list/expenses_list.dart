import 'package:expences_new_app/Widgets/expense_list/expenses_items.dart';
import 'package:flutter/material.dart';

import '../../Models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required List<Expense> regesterdExpenses,
    required this.onremoveExpense,
  }) : _regesterdExpenses = regesterdExpenses;
  final void Function(Expense expense) onremoveExpense;
  final List<Expense> _regesterdExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _regesterdExpenses.length,
      itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.7),
            margin: Theme.of(context).cardTheme.margin,
          ),
          key: ValueKey(_regesterdExpenses[index]),
          onDismissed: (direction) =>
              onremoveExpense(_regesterdExpenses[index]),
          child: ExpensesItem(expense: _regesterdExpenses[index])),
    );
  }
}
