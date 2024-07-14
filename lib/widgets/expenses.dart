import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Yacht",
        amount: 200000,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: "Food",
        amount: 2,
        date: DateTime.now(),
        category: Category.food),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpesnse(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('Start adding your expenses.'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpesnse);
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              width: 50,
              color: Colors.yellow,
              child: IconButton(
                  onPressed: _openAddExpenseOverlay,
                  icon: const Icon(Icons.add))),
        ],
        title: const Text('Expensses Tracker'),
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
