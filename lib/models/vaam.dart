class Vaam {
  String name;
  String type;
  int amount;
  int minDepositRequierd;
  int numberOfInstallments;
  int restDays;
  double interestRate;
  int installmentsDeadLineDays;
  bool isShowable;

  Vaam(
      {this.installmentsDeadLineDays,
      this.amount,
      this.restDays,
      this.interestRate,
      this.numberOfInstallments,
      this.name,
      this.isShowable,
      this.type,
      this.minDepositRequierd});
}
