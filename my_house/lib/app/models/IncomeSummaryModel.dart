class IncomeSummaryModel{
  String incomeSourceType;
  String mode;
  String houseMember;
  String amount;

  IncomeSummaryModel(
      this.incomeSourceType, this.mode, this.houseMember, this.amount);

  @override
  String toString() {
    return 'IncomeSummaryModel{incomeSourceType: $incomeSourceType, mode: $mode, houseMember: $houseMember, amount: $amount}';
  }


}