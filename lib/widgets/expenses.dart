import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

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
        amount: 200,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: "Food",
        amount: 200,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Electricity",
        amount: 100,
        date: DateTime.now(),
        category: Category.bills),
    Expense(
        title: "Bus",
        amount: 150,
        date: DateTime.now(),
        category: Category.transport),
    Expense(
        title: "Shirt",
        amount: 50,
        date: DateTime.now(),
        category: Category.clothes),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
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
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        closeIconColor: Colors.black,
        duration: const Duration(seconds: 3),
        content: Text(
          'Expense deleted.',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        action: SnackBarAction(
            textColor: Theme.of(context).colorScheme.onPrimary,
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('Start adding your expenses.'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpesnse);
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: SizedBox(
                child: IconButton(
                  onPressed: _openAddExpenseOverlay,
                  icon: const Icon(Icons.add),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
        title: const Text('Expensses Tracker'),
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
