class ExpenseSummaryModel{
  String expenseName;
  String mode;
  String houseMember;
  double amount;
  String date;
  String expenseCategory;

  ExpenseSummaryModel(this.expenseName, this.mode, this.houseMember,
      this.amount, this.date, this.expenseCategory);

  @override
  String toString() {
    return 'ExpenseSummaryModel{expenseName: $expenseName, mode: $mode, houseMember: $houseMember, amount: $amount, date: $date, expenseCategory: $expenseCategory}';
  }
}