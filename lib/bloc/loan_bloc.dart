import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planner_app/models/loan_model.dart';
import 'package:rxdart/rxdart.dart';

part 'loan_state.dart';

class LoanBloc {
  late int initialAmount = 50000;
  late int initialMonth = 1;
  late int monthlyPayment = 1;
  late BehaviorSubject<LoanModel> calcLoan;

  LoanBloc(this.initialAmount, this.initialMonth, this.monthlyPayment) {
    calcLoan = BehaviorSubject<LoanModel>();
  }

  Stream counterObservable() => calcLoan.stream;

  void monthlyPayCalc () {
    monthlyPayment = initialAmount + initialMonth;
    calcLoan.sink.add(LoanModel());
  }
}
