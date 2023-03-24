// import 'dart:async';

import 'package:planner_app/bloc/account_status_bloc.dart';
import 'package:planner_app/data/models/loan_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final reloadAccountSt = PublishSubject<AccountStatusState>();
  final calcLoan = BehaviorSubject<LoanModel>();


}
