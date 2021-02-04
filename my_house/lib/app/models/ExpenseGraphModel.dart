class ExpenseGraphModel{
  String expenseCategory;
  double amount;

  ExpenseGraphModel(this.expenseCategory, this.amount);

  @override
  String toString() {
    return 'ExpenseGraphModel{expenseCategory: $expenseCategory, amount: $amount}';
  }



}