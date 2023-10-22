import 'package:expences_new_app/Models/expense.dart';
import 'package:expences_new_app/Widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.Expenses});
  final List<Expense> Expenses;
  List<BucketExpense> get Bukets {
    return [
      BucketExpense.forCategory(Expenses, Category.food),
      BucketExpense.forCategory(Expenses, Category.leisure),
      BucketExpense.forCategory(Expenses, Category.travel),
      BucketExpense.forCategory(Expenses, Category.work),
    ];
  }

  double get maxTotalExpenses {
    double maxTotalExpenses = 0;

    for (var element in Bukets) {
      if (element.totalExpenses > maxTotalExpenses) {
        maxTotalExpenses = element.totalExpenses;
      }
    }
    return maxTotalExpenses;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary.withOpacity(0.5),
          Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: Column(children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final ele in Bukets)
                ChartBar(
                  fill: ele.totalExpenses == 0
                      ? 0
                      : ele.totalExpenses / maxTotalExpenses,
                )
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: Bukets.map((e) => Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Icon(CategoryIcons[e.category]),
              ))).toList(),
        )
      ]),
    );
  }
}
