import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();
final formatter = DateFormat.yMEd();

enum Category {
  food,
  bills,
  clothes,
  transport,
  other,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.bills: Icons.receipt,
  Category.clothes: Icons.shopping_bag,
  Category.transport: Icons.directions_bus,
  Category.other: Icons.category,
};

const categoryColors = {
  Category.food: Colors.green,
  Category.bills: Colors.red,
  Category.clothes: Colors.blue,
  Category.transport: Colors.amber,
  Category.other: Colors.purple,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList() {
    print(expenses);
  }

  double get totalExpenses {
    double total = 0;
    for (final expense in expenses) {
      total += expense.amount;
    }

    return total;
  }
}
