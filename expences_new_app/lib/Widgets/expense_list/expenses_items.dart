// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:expences_new_app/Models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({
    Key? key,
    required this.expense,
  }) : super(key: key);
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.titel,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text('DA ${expense.amount.toString()}'),
                Spacer(),
                Row(
                  children: [
                    Icon(CategoryIcons[expense.category]),
                    SizedBox(
                      width: 20,
                    ),
                    Text(expense.FormatTodate())
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
