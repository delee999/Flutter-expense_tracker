import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_lists/expenses_item.dart';
import 'package:flutter/material.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpenses});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: const Color.fromARGB(255, 255, 70, 70),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              SizedBox(width: 2),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Delete",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpenses(expenses[index]);
        },
        child: ExpensesItem(
          expenses[index],
        ),
      ),
    );
  }
}
