class IncomeModel{
  String id;
  String incomeSourceType;
  String mode;
  String houseMember;
  String amount;


  IncomeModel({
      this.id, this.incomeSourceType, this.mode, this.houseMember, this.amount});

  IncomeModel.fromMap(Map snapshot,String id) :
        id = id ?? '',
        incomeSourceType = snapshot['incomeSourceType'] ?? '',
        mode = snapshot['mode'] ?? '',
        houseMember = snapshot['houseMember'] ?? '',
        amount = snapshot['amount'] ?? '';

  toJson() {
    return {
      "incomeSourceType": incomeSourceType,
      "mode": mode,
      "houseMember": houseMember,
      "amount": amount,
    };
  }

  @override
  String toString() {
    return 'IncomeModel{incomeSourceType: $incomeSourceType, mode: $mode, houseMember: $houseMember, amount: $amount}';
  }
}