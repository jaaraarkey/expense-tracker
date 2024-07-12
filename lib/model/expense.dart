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
    ;
  }
}
