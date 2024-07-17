import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/chart/chart_bar.dart';

import 'package:expense_tracker/model/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.transport),
      ExpenseBucket.forCategory(expenses, Category.clothes),
      ExpenseBucket.forCategory(expenses, Category.other),
      ExpenseBucket.forCategory(expenses, Category.bills),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     const Color.fromARGB(255, 44, 43, 43).withOpacity(0.7),
        //     const Color.fromARGB(255, 200, 26, 26).withOpacity(0.7),
        //   ],
        //   begin: Alignment.bottomCenter,
        //   end: Alignment.topCenter,
        // ),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.white.withOpacity(.2)
                : Colors.grey.withOpacity(.2),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 225, 56, 255).withOpacity(.8),
            const Color.fromARGB(255, 27, 3, 247).withOpacity(.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Icon(categoryIcons[bucket.category],
                          color: isDarkMode ? Colors.white : Colors.white),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
