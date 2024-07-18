import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  size: 24,
                  categoryIcons[expense.category],
                  color: categoryColors[expense.category],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(expense.title),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(expense.formattedDate)),
                  ],
                ),
                const Spacer(),
                Row(children: [
                  const SizedBox(width: 16),
                  Text('€${expense.amount.toStringAsFixed(2)}'),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
