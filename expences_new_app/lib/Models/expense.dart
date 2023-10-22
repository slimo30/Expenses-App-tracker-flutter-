import "package:expences_new_app/Widgets/expense_list/expenses.dart";
import "package:flutter/material.dart";
import "package:uuid/uuid.dart";
import "package:intl/intl.dart";

const uuid = Uuid();
//dateformat
final dateFormat = DateFormat().add_MMMMEEEEd();

// using map with enum

enum Category { food, travel, leisure, work }

const CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String titel;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.category,
      required this.titel,
      required this.amount,
      required this.date})
      : id = uuid.v4();
  String FormatTodate() {
    return dateFormat.format(date);
  }
}

class BucketExpense {
  final Category category;
  final List<Expense> expenses;

  BucketExpense({required this.category, required this.expenses});
  BucketExpense.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => (element.category == category))
            .toList();

  double get totalExpenses {
    double sum = 0;
    for (var expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
