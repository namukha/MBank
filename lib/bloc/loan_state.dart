part of 'loan_bloc.dart';

@immutable
class LoanState {
  late final String amount;
  late final String months;

  LoanState({
    this.amount = '50000',
    this.months = '1',
  });

  List<Object?> get props => [
    amount,
    months,
  ];

}
