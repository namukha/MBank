
class LoanModel {
  late final String amount;
  late final String months;

  LoanModel({
    this.amount = '50000',
    this.months = '1',
  });

  List<Object?> get props => [
    amount,
    months,
  ];

}